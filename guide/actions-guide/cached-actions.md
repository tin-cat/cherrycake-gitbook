# Cached actions

When an action is configured as cacheable, when a request is received for that action, the cached output will be returned instead of executing the method. This can provide extremely efficient and short response times as the engine will only load the minimal set of modules needed to attend the cached request.

To activate caching for an action, set the `isCache` setup key to true when creating the [Action](../../reference/core-classes/action/methods.md#__construct-setup) object.

To use a different cache provider, TTL or prefix, specify also the `cacheProviderName`, `cacheTtl` or `cachePrefix` [setup keys](../../reference/core-classes/action/methods.md#__construct-setup). See [Working with Cache](../cache-guide/) for more details on this concepts.

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

## Removing an action from cache

If you need to remove an action from cache before its TTL expiration time arrives, use the [Action::clearCache](../../reference/core-classes/action/methods.md#resetcache), like this:

```php
$e->Actions->getAction("home")->clearCache();
```

For complex actions with variable path components or parameters, you must specify the specific path components or parameters values for which you want to clear the cache as an argument.

For example, for this action that has one fixed and one variable path component to attend requests like `/product/479`:

```php
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
```

If we wanted to clear the cache for the request to the product with id `479`, we would do this:

```php
$e->Actions->getAction("home")->clearCache([
    "productId" => 479
]);
```





