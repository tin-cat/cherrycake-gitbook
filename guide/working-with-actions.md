# Working with Actions

[Actions](../reference/core-modules/actions.md) is the routing core module of Cherrycake that allows your application to receive requests and attend them accordingly.

{% hint style="success" %}
[Actions](../reference/core-modules/actions.md) is the default base core module because it is what you'll need in most cases. If you're experimenting with different ways of using Cherrycake, you can specify a different set of base modules when initializing the engine with [Engine::init](../reference/core-classes/engine.md#init-appnamespace-setup)
{% endhint %}

When using [Actions](../reference/core-modules/actions.md), all the modules who will be receiving requests should map their actions in the [Module::mapActions](../reference/core-classes/module.md#mapactions) method, by calling [Actions::mapAction](../reference/core-modules/actions.md#mapaction-actionname-action).

When a request is received, [Actions](../reference/core-modules/actions.md) will look through all the mapped actions. If any of them matches the current request, it will load the associated module and run the mapped method.

{% hint style="info" %}
[Actions](../reference/core-modules/actions.md) calls [mapActions](../reference/core-classes/module.md#mapactions) methods on all available modules during its initialization, using the [Engine::callMethodOnAllModules](../reference/core-classes/engine.md#callmethodonallmodules-methodname)
{% endhint %}

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

### Mapping actions for complex routes

In the example above, the `pathComponents` is left to false because we wanted the action to respond to requests to the root `/` page. To map actions that respond to more complex routes like `/about/contact`, we pass `pathComponents` an array of [RequestPathComponent](../reference/core-classes/requestpathcomponent.md) objects representing the segments of the path in between the `/` symbols.

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

{% hint style="info" %}
See [RequestPathComponent::\_\_construct](../reference/core-classes/requestpathcomponent.md#__construct-setup) to learn more about other options when setting up path components for complex routes.
{% endhint %}

### Mapping actions for dynamic paths

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

{% hint style="info" %}
Check out [Working with Security](working-with-security.md#security-rules) to learn more about the `securityRules` and filters we can configure when mapping actions with `pathComponents`.
{% endhint %}

To receive the `productId` value that was passed when the client requested `/product/4739`,  we simply add a `request` parameter to the method triggered by the action \(`Products::view` in the example above\), and we'll get a [Request](../reference/core-classes/request.md) object that contains, among other useful things, the value of the `productId` path section:

```php
function view($request) {
    echo "The requested product id is ".$request->productId;
}
```

### Mapping actions that accept GET or POST parameters

To map actions that receive parameters, pass an array of [RequestParameter](../reference/core-classes/requestparameter.md) objects via the `parameters` key when creating [Request](../reference/core-classes/request.md) object. For example, mapping an action that receives a `userId` parameter via GET would look like this:

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

{% hint style="info" %}
Check out [Working with Security](working-with-security.md#security-rules) to learn more about the `securityRules` and `filters` we can configure when mapping actions with `parameters`.
{% endhint %}

