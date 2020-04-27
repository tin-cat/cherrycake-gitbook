---
description: All the performance benefits of a cache system when working with Items.
---

# Item cache

Activating cache for your [Item](../../reference/core-classes/item/) class is as easy as setting the `loadFromIdMethod` of your class to `queryDatabaseCache`:

```php
...

class Movie extends \Cherrycake\Item {
    protected $tableName = "movies";
    protected $loadFromIdMethod = "queryDatabaseCache";
    protected $fields = [
        "id" => [
            "type" => \Cherrycake\Modules\DATABASE_FIELD_TYPE_INTEGER
        ],
        "title" => [
            "type" => \Cherrycake\Modules\DATABASE_FIELD_TYPE_STRING
        ],
        "summary" => [
            "type" => \Cherrycake\Modules\DATABASE_FIELD_TYPE_TEXT
        ],
        "year" => [
            "type" => \Cherrycake\Modules\DATABASE_FIELD_TYPE_YEAR
        ],
        "imdbRating" => [
            "type" => \Cherrycake\Modules\DATABASE_FIELD_TYPE_FLOAT
        ]
    ];
}
```

You can optionally add some other properties if you want to change the defaults:

* **`cacheProviderName`** The name of the cache provider to use. Default: `engine`
* **`cacheTtl`**: The TTL to use when caching data for this Item. Default: `CACHE_TTL_NORMAL`
* **`cacheSpecificPrefix`**: The [key prefix](../../reference/core-modules/cache/cache-methods.md#buildcachekey) to use when caching data for this item. Default: none

Just like this, whenever you're loading a `Movie`, it will be loaded extremely fast from the cache without any actual request to the database, as long as it has been loaded before at least one time, and the TTL expiration time hasn't yet passed.

If you need to remove an item from cache, use the [Item::clearCache](../../reference/core-classes/item/item-methods.md#clearcache) method. For example, after changing some data in a `Movie`, be sure to also clear the cache for that movie so the next time is accessed the information is loaded from the database and not the cache, so the updated information will be used and stored again in cache. Like this:

```php
$movie->update([
    "imdbRating" => 8.7
]);
$movie->clearCache();
```

