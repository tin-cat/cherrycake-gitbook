# Removing queries from cache

You can manually remove a cached query from cache before its natural TTL-driven expiration time by using the [DatabaseProvider::clearCacheQuery](../../reference/core-classes/databaseprovider/databaseprovider-methods.md#clearcachequery) method, here's an example:

```php
$e->Database->main->clearCacheQuery([
    "uniqueId" => "usersSignedUpLast24Hours"
]);
```

Because query cache keys are automatically generated if you don't specify any [Cache key naming](cache-key-naming.md) when calling methods like [DatabaseProvider::queryCache](../../reference/core-classes/databaseprovider/databaseprovider-methods.md#querycache) and [DatabaseProvider::prepareAndExecuteCache](../../reference/core-classes/databaseprovider/databaseprovider-methods.md#prepareandexecutecache), you can only remove queries from cache that have been originally performed with a specific Cache key naming.

> The most usual way to cache queries and then be able to remove them whenever we need is to use a known `uniqueId` for each query, like in the example above.



