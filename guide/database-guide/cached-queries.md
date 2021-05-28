# Cached queries

Cached queries allow you to dramatically improve performance in certain situations by preventing the database server from repeatedly performing the same query, storing the results in cache instead.

To perform a basic query with cache, use the [DatabaseProvider::queryCache](../../reference/core-classes/databaseprovider/databaseprovider-methods.md#querycache) method, this is how it would look:

```php
$result = $e->Database->main->queryCache(
    "select * from users order by rand()",
    \Cherrycake\CACHE_TTL_1_MINUTE
);
```

When iterating over the results like we did in the [Basic queries](basic-queries.md) section, you would get something like this:

```php
Douglas Engelbart
John Horton Conway
Frank Abagnale
Carl Sagan
Richard Feynmann
```

Note here that, even though the results have been randomly ordered thanks to the  `by rand()` clause in the SQL statement, we'll always get the results in the same order if we execute the query multiple times. This is because the results were stored in the cache, and the query is not actually running, we're just getting the same results the cache system got in the first run.

> Because the cached results will expire after 1 minute because we set the TTL to `CACHE_TTL_1_MINUTE`, the result order will change if we execute the query when a minute has passed from the first execution, and they will remain in the same order for 1 more minute.

{% hint style="success" %}
See this example working in the [Cherrycake documentation examples](https://documentation-examples.cherrycake.io/example/databaseGuideCachedQueries) site.
{% endhint %}

## Cached prepared queries

To use caching in prepared queries, use the [DatabaseProvider::prepareAndExecuteCache](../../reference/core-classes/databaseprovider/databaseprovider-methods.md#prepareandexecutecache) method, which works like the normal, non-cached prepared query methods, but adding the additional cache parameters you already know of:

```sql
$result = $e->Database->main->prepareAndExecuteCache(
    "select name from users where dateSignUp >= ?",
    [
        [
            "type" => \Cherrycake\Database\DATABASE_FIELD_TYPE_DATETIME,
            "value" => mktime(0, 0, 0, 1, 1, 2020)
        ]
    ],
    \Cherrycake\CACHE_TTL_1_MINUTE
);
```

> Remember that, for security reasons, prepared queries are the recommended way of querying the database, specially when you're using data coming from untrusted sources in your query.

