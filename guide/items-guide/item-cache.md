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



