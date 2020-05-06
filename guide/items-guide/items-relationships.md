# Items with relationships

Cherrycake does not restricts you on how to establish relationships between tables in your database, and the [Item](../../reference/core-classes/item/) and [Items](../../architecture/items.md) classes provide some capabilities that will help you build the relationship structure of your liking.

For example, in addition to our `movies` table, let's imagine we have also a simple `directors` table containing the names and birth years of movie directors, and that it looks like this:

| Field name | Specs |  |
| :--- | :--- | :--- |
| **`id`** | `unsigned` `int` `auto_increment` `primary key` | The unique id to identify movies. |
| **`name`** | `varchar` | The name of the director. |
| **`birthYear`** | `year` | The year the director was born. |

A simple relationship would be one that allows us to get the name of the director of one of our movies. Since we already defined our [`Movie`](./#creating-an-item-class) class, let's now define a class to represent a director. We create the file `/classes/Director.class.php`, and it looks like this:

```php
<?php

namespace CherrycakeApp;

class Director extends \Cherrycake\Item {
    protected $tableName = "directors";
    protected $fields = [
        "id" => [
            "type" => \Cherrycake\DATABASE_FIELD_TYPE_INTEGER
        ],
        "name" => [
            "type" => \Cherrycake\DATABASE_FIELD_TYPE_STRING
        ]
    ];
}
```

Now, we add a method to our `Movie` class that allows us to get a `Director` object:

```php
class Movie extends \Cherrycake\Item {
    ...
    
    function getDirector() {
        return new Director([
            "loadMethod" => "fromId",
            "id" => $this->directorId
        ]);
    }
}
```

So now, whenever we have a `Movie` object, we can get its Director by calling the `getDirector` method, for example:

```php
$movies = new Movies([
    "fillMethod" => "fromParameters",
    "p" => [
        "limit" => 5,
        "order" => ["random"]
    ]
]);

foreach ($movies as $movie)
    echo "{$movie->title} directed by {$movie->getDirector()->name}\n";
```

```text
Explorers directed by Joe Dante
E.T. the Extra-Terrestrial directed by Steven Spielberg
Tron directed by Steven Lisberger
Close Encounters of the Third Kind directed by Steven Spielberg
Arrival directed by Denis Villeneuve
```

Getting the director's name was this straightforward: `$movie->getDirector()->name`

> Note that in this example we've also applied the `random` order, which is always available in addition to your custom orders, to simply randomize the order of the resulting [Item](../../reference/core-classes/item/) objects.

## Custom filtering with relationships

More than once you'll need to look for data in other tables when using your [Items](../../architecture/items.md) classes. For example, let's say we want to be able to get all the movies directed by a specific director

