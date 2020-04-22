# Actions guide

[Actions](../reference/core-modules/actions-1/actions.md) is the routing core module of Cherrycake that allows your application to receive requests and attend them accordingly.

> [Actions](../reference/core-modules/actions-1/actions.md) is the default base core module because it is what you'll need in most cases. If you're experimenting with different ways of using Cherrycake, you can specify a different set of base modules in [Engine::init](../reference/core-classes/engine/#init-appnamespace-setup)

When using [Actions](../reference/core-modules/actions-1/actions.md), all the modules who will be receiving requests should map their actions in the [Module::mapActions](../reference/core-classes/module/#mapactions) method, by calling [Actions::mapAction](../reference/core-modules/actions-1/actions.md#mapaction-actionname-action).

When a request is received, [Actions](../reference/core-modules/actions-1/actions.md) will look through all the mapped actions. If any of them matches the current request, it will load the associated module and run the mapped method.

> [Actions](../reference/core-modules/actions-1/actions.md) calls [mapActions](../reference/core-classes/module/#mapactions) methods on all available modules during its initialization, using the [Engine::callMethodOnAllModules](../reference/core-classes/engine/#callmethodonallmodules-methodname)

For example, the following module maps a simple action named `home` that will call the `viewHome` method when the root page `/` is requested:

```php
<?php

namespace CherrycakeApp\Modules;

class Home extends \Cherrycake\Module {

    public static function mapActions() {
        global $e;
        
        $e->Actions->mapAction([
            "home",
            new \Cherrycake\ActionHtml([
                "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
                "moduleName" => "Home",
                "methodName" => "viewHome",
                "request" => new \Cherrycake\Request([
                    "pathComponents" => false
                ])
            ])
        ]);
        
    }
    
    function viewHome() {
        // Show the home page
    }

}
```

## Complex routes

In the example above, the `pathComponents` is left to false because we wanted the action to respond to requests to the root `/` page. To map actions that respond to more complex routes like `/about/contact`, we pass `pathComponents` an array of [RequestPathComponent](../reference/core-classes/requestpathcomponent/) objects representing the segments of the path in between the `/` symbols.

In this example, we map an action that will respond when the `/about/contact` path is requested:

```php
...

$e->Actions->mapAction([
    "aboutContact",
    new \Cherrycake\ActionHtml([
        "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
        "moduleName" => "About",
        "methodName" => "viewContact",
        "request" => new \Cherrycake\Request([
            "pathComponents" => [
                new \Cherrycake\RequestPathComponent([
                    "type" => \Cherrycake\REQUEST_PATH_COMPONENT_TYPE_FIXED,
                    "string" => "about"
                ]),
                new \Cherrycake\RequestPathComponent([
                    "type" => \Cherrycake\REQUEST_PATH_COMPONENT_TYPE_FIXED,
                    "string" => "contact"
                ])
            ]
        ])
    ])
]);

...
```

> See [RequestPathComponent::\_\_construct](../reference/core-classes/requestpathcomponent/#__construct-setup) to learn more about other options when setting up path components for complex routes.

## Dynamic paths

A lot of times we'll need to respond to requests where some component of the path is dynamic, like when we are attending requests like `/product/4739` to show some specific product id. For this, we use the `REQUEST_PATH_COMPONENT_TYPE_VARIABLE_NUMERIC` type instead, like this:

```php
...

$e->Actions->mapAction([
    "viewProduct",
    new \Cherrycake\ActionHtml([
        "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
        "moduleName" => "Products",
        "methodName" => "view",
        "request" => new \Cherrycake\Request([
            "pathComponents" => [
                new \Cherrycake\RequestPathComponent([
                    "type" => \Cherrycake\REQUEST_PATH_COMPONENT_TYPE_FIXED,
                    "string" => "product"
                ]),
                new \Cherrycake\RequestPathComponent([
                    "type" => \Cherrycake\REQUEST_PATH_COMPONENT_TYPE_VARIABLE_NUMERIC,
                    "name" => "productId",
                    "securityRules" => [
                        \Cherrycake\SECURITY_RULE_NOT_EMPTY,
                        \Cherrycake\SECURITY_RULE_INTEGER,
                        \Cherrycake\SECURITY_RULE_POSITIVE
                    ]
                ])
            ]
        ])
    ])
]);

...
```

In this case, instead of passing a `string` like we do with the `REQUEST_PATH_COMPONENT_TYPE_FIXED` type for the `product` part of the path, we pass a `name` to identify the received value, and a `securityRules` array to be sure the value we receive is secure.

In our example, the `viewProduct` action is triggered when we receive a request like `/product/4739`, and we specify that `4739` will be stored as `productId`, that it cannot be empty and that it has to be a positive integer.

> Check out [Working with Security](security-guide.md#security-rules) to learn more about the `securityRules` and filters we can configure when mapping actions with `pathComponents`.

To receive the `productId` value that was passed when the client requested `/product/4739`,  we simply add a `request` parameter to the method triggered by the action \(`Products::view` in the example above\), and we'll get a [Request](../reference/core-classes/request.md) object that contains, among other useful things, the value of the `productId` path section:

```php
function view($request) {
    echo "The requested product id is ".$request->productId;
}
```

## Accept GET or POST parameters

To map actions that receive parameters, pass an array of [RequestParameter](../reference/core-classes/requestparameter/) objects via the `parameters` key when creating [Request](../reference/core-classes/request.md) object. For example, mapping an action that receives a `userId` parameter via GET would look like this:

```php
...

$e->Actions->mapAction([
    "viewUser",
    new \Cherrycake\ActionHtml([
        "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
        "moduleName" => "Users",
        "methodName" => "view",
        "request" => new \Cherrycake\Request([
            "pathComponents" => [
                new \Cherrycake\RequestPathComponent([
                    "type" => \Cherrycake\REQUEST_PATH_COMPONENT_TYPE_FIXED,
                    "string" => "user"
                ])
            ],
            "parameters" => [
                new \Cherrycake\RequestParameter([
                    "type" => \Cherrycake\REQUEST_PARAMETER_TYPE_GET,
    						    "name" => "userId",
                    "securityRules" => [
                        \Cherrycake\SECURITY_RULE_TYPICAL_ID
                    ]
    						])
            ]
        ])
    ])
]);

...
```

This action will be triggered when URLs like `/user?userId=381` are requested. You can then get the `userId` value just like we did above for dynamic paths:

```php
function view($request) {
    echo "The requested user id ".$request->userId;
}
```

> Check out [Working with Security](security-guide.md#security-rules) to learn more about the `securityRules` and `filters` you can configure when mapping actions with `parameters`.

## Cached actions

When an action is configured as cacheable, when a request is received for that action, the cached output will be returned instead of executing the method. This can provide extremely efficient and short response times as the engine will only load the minimal set of modules needed to attend the cached request.

To activate caching for an action, set the `isCache` setup key to true when creating the [Action](../reference/core-classes/action/methods.md#__construct-setup) object.

To use a different cache provider, TTL or prefix, specify also the `cacheProviderName`, `cacheTtl` or `cachePrefix` [setup keys](../reference/core-classes/action/methods.md#__construct-setup). See [Working with Cache](cache-guide.md) for more details on this concepts.

For example, if we wanted to activate the cache for the action we used in the first example on this section, it would look like this:

```php
...

$e->Actions->mapAction([
    "home",
    new \Cherrycake\ActionHtml([
        "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
        "moduleName" => "Home",
        "methodName" => "viewHome",
        "request" => new \Cherrycake\Request([
            "pathComponents" => false
        ]),
        "isCache" => true
    ])
]);

...
```

Furthermore, if we wanted to use a cache provider and TTL different from the default ones:

```php
...

$e->Actions->mapAction([
    "home",
    new \Cherrycake\ActionHtml([
        "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
        "moduleName" => "Home",
        "methodName" => "viewHome",
        "request" => new \Cherrycake\Request([
            "pathComponents" => false
        ]),
        "isCache" => true,
        "cacheProviderName" => "redis",
        "cacheTtl" => \Cherrycake\CACHE_TTL_SHORT
    ])
]);

...
```

The default cache provider is called `engine`, and uses [APCu](https://www.php.net/manual/en/book.apcu.php) for a fast yet basic caching mechanism. See Working with Cache to use other more advanced alternatives like [Redis](https://redis.io).

## Actions sensible to brute force attacks

Dictionary attacks and other kinds of brute force attacks often rely on the ability to send lots of requests per second in order to, for example, try different passwords to hack an account. In those cases, the faster our server responds, the easier is for the attacker to try many passwords per second.

One way of making it difficult for the attackers is to add an intentional delay to the response, so the amount of time needed to try a reasonable amount of passwords rises quickly, hopefully discouraging the attacker.

By setting the `isSensibleToBruteForceAttacks` setup key to true when creating the [Action](../reference/core-classes/action/methods.md#__construct-setup) object, Cherrycake will take care of adding this delay to the request.

The delay is only added when the method called by the action returns `false`. Be sure to return `false` in methods mapped as actions when the sensible task was unsuccessful. For example: If a received  password or key of any kind was checked against a database or any kind of authentication method, and it failed.

> A random delay is used to emulate an unstable connection for added stealthiness. This can be adjusted by setting the `sleepSecondsWhenActionSensibleToBruteForceAttacksFails` configuration key of the [Actions](../reference/core-modules/actions-1/actions-configuration.md) module.

