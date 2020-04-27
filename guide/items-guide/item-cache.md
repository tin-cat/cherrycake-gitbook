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
* **`cacheSpecificPrefix`**: The key prefix to use when caching data for this item. Default: none

