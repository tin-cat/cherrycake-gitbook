# Cache key naming

Each object stored in cache has its own unique identifier key. When you run a cached query without specifying any [`cacheKeyNamingOptions`](../../reference/core-classes/databaseprovider/databaseprovider-methods.md#querycache) parameter like we did in the [Cached queries](cached-queries.md) section, the cache key is automatically generated by creating a unique hash from the SQL statement itself.

For example, when executing the cached query`select * from users order by rand()`, a unique key is generated internally that looks like this:

```php
CherrycakeApp_Database_64df95723d106ba80b0cf725bc56ddd1
```

> When letting Database generate automatically the cache keys, different keys are generated even if a single character of the SQL statement has changed.

This means that you can trust a different cache key will be generated for each different query you perform, so in most simple queries you don't need to care about cache key collisions.

But in certain situations you'll need to cache different queries under the same cache key to get the maximum benefits of using a cached database system. For example, when you're retrieving data from the database relative to the current date and time.

Imagine you want to query all the users that have signed up to your web app during the last 24 hours, and that you want that query to be cached. You could do that like this:

```php
$timestamp24HoursEarlier = time() - (24 * 60 * 60);
$result = $e->Database->main->queryCache(
    "select * from users where dateSignUp >= '".date("Y-n-j H:i:s", $timestamp24HoursEarlier)."'",
    \Cherrycake\CACHE_TTL_1_HOUR
);
```

Can you see the problem here? We want the query to be cached for an hour and we haven't specified the [`cacheKeyNamingOptions`](../../reference/core-classes/databaseprovider/databaseprovider-methods.md#querycache) parameter, so the unique cache key for this query will be automatically generated using the SQL statement.

The problem is that, because we're basing our query on a value that changes every second, the SQL statement itself also changes every second, thus generating a different automatic cache key almost every time the cached query is executed.

> This will cause our cache memory to fill with useless objects, and will cause the query to be executed once per second if it is requested very often.

To solve this kind of situations, we specify our own cache key instead of letting Database create its own automatically. We do this by passing the [`cacheKeyNamingOptions`](../../reference/core-classes/databaseprovider/databaseprovider-methods.md#querycache) parameter to [DatabaseProvider::queryCache](../../reference/core-classes/databaseprovider/databaseprovider-methods.md#querycache), like this:

```php
$timestamp24HoursEarlier = time() - (24 * 60 * 60);
$result = $e->Database->main->queryCache(
    "select * from users where dateSignUp >= '".date("Y-n-j H:i:s", $timestamp24HoursEarlier)."'",
    \Cherrycake\CACHE_TTL_1_HOUR,
    [
        "uniqueId" => "usersSignedUpLast24Hours"
    ]
);
```

