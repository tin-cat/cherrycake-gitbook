---
description: >-
  Using Items in your Cherrycake application brings you many benefits when
  interacting with the primordial objects of your app, like optimized loading,
  storage, caching and embedded security mechanisms.
---

# Items guide

Items are Cherrycake's conceptualization of the fundamental objects stored in a database. For example, in an e-commerce site, a product would be an Item, but also would a user, a product category or an invoice.

## Creating an Item class

Items always come from a database table, so let's imagine we want to define an [Item](../reference/core-classes/item/) to work with the products that are stored in our database, in a table called `products` with the following fields:

| Field name | Specs |  |
| :--- | :--- | :--- |
| **`id`** | `unsigned` `int` `auto_increment` `primary key` | The unique id to identify products. |
| **`name`** | `varchar` | The name of the product. |
| **`description`** | `text` | A description of the product. |
| **`dateAdded`** | `datetime` | The date and time the product was added to the database. |

Items are [App classes](classes-guide.md#app-class-files) that extend the Cherrycake's [Item](../reference/core-classes/item/) core class, so we create the Product class in the file `/classes/Product.class.php`, and it looks like this:

```php
<?php

namespace CherrycakeApp;

class Product extends \Cherrycake\Item {
    protected $tableName = "products";
    protected $fields = [
        "id" => [
            "type" => \Cherrycake\Modules\DATABASE_FIELD_TYPE_INTEGER
        ],
        "name" => [
            "type" => \Cherrycake\Modules\DATABASE_FIELD_TYPE_STRING
        ],
        "decription" => [
            "type" => \Cherrycake\Modules\DATABASE_FIELD_TYPE_TEXT
        ],
        "dateAdded" => [
            "type" => \Cherrycake\Modules\DATABASE_FIELD_TYPE_DATETIME
        ]
    ];
}
```



