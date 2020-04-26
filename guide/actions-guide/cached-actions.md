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

