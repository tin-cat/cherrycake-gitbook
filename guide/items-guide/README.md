---
description: >-
  Using Items in your Cherrycake application brings you many benefits when
  interacting with the primordial objects of your app, like optimized loading,
  storage, caching and embedded security mechanisms.
---

# Items guide

Items are Cherrycake's conceptualization of the fundamental objects stored in a database. For example, in an e-commerce site, a product would be an Item, but also would a user, a product category or an invoice.

## Creating an Item class

Items always come from a database table, so let's imagine we want to define an [Item](../../reference/core-classes/item/) to work with the movies that are stored in our database, in a table called `movies` with the following fields:

| Field name | Specs |  |
| :--- | :--- | :--- |
| **`id`** | `unsigned` `int` `auto_increment` `primary key` | The unique id to identify movies. |
| **`title`** | `varchar` | The name of the movie. |
| **`summary`** | `text` | A description of the product. |
| **`year`** | `year` | The year the movie was released. |
| **`dateAdded`** | `datetime` | The date and time the movie was added to the database. |

Items are [App classes](../classes-guide.md#app-class-files) that extend the Cherrycake's [Item](../../reference/core-classes/item/) core class, so we create the `Movie` class in the file `/classes/Movie.class.php`, and it looks like this:

```php
<?php

namespace CherrycakeApp;

class Movie extends \Cherrycake\Item {
    protected $tableName = "movies";
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
        "dateAdded" => [
            "type" => \Cherrycake\Modules\DATABASE_FIELD_TYPE_DATETIME
        ]
    ];
}
```

By setting the `tableName` property to the name of the table where the movies are stored, and setting up the `fields` property to reflect the name of the fields and their characteristics, we've already created a functional Item that can now represent a movie in our app with the added benefits of using Cherrycake Items.

> See [Database constants](../../reference/core-modules/database.md#constants) for all the available field types. Also see [Item::$fields](../../reference/core-classes/item/item-properties.md#fields) for more ways to customize fields.

Now, what can you do with your new `Movie` class? Let's see how to create a `Movie` object we can manipulate. Let's say we want to load the movie with id `138`:

```php
$product = new Product([
    "loadMethod" => "fromId",
    "id" => 138
]);
```

Field values for an Item are accessed just like regular properties, like this:

```php
echo $product->name;
```

```text
"Brainstorm" by 
```

