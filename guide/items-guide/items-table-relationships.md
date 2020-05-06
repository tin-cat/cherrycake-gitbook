# Items table relationships

Cherrycake does not restricts you on how to establish relationships between tables in your database, and the [Item](../../reference/core-classes/item/) and [Items](../../architecture/items.md) classes provide some capabilities that will help you build the relationship structure of your liking.

For example, in addition to our `movies` table, let's imagine we have also a simple `directors` table containing the names of movie directors, and that it looks like this:

| Field name | Specs |  |
| :--- | :--- | :--- |
| **`id`** | `unsigned` `int` `auto_increment` `primary key` | The unique id to identify movies. |
| **`name`** | `varchar` | The name of the director. |

A simple relationship would be one that allows us to get the name of the director of one of our movies. Since we already defined our [`Movie`](./#creating-an-item-class) class, let's now define a class to represent a director. We create the file `/classes/Director.class.php`, and it looks like this:

```php
<?php

namespace CherrycakeApp;

class Director extends \Cherrycake\Item {
    protected $tableName = "directors";
    protected $fields = [
        "id" => [
            "type" => \Cherrycake\Modules\DATABASE_FIELD_TYPE_INTEGER
        ],
        "name" => [
            "type" => \Cherrycake\Modules\DATABASE_FIELD_TYPE_STRING
        ]
    ];
}
```



