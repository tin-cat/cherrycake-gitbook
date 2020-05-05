---
description: Item lists are groups of Item objects retrieved from the database.
---

# Item lists

Working with Items becomes a lot more powerful when in conjunction with Item lists. Items allows you to retrieve multiple Items at once from the database and work with them as you would do with a regular list.

Just like when creating single Item classes, Item lists are [App classes](../classes-guide.md#app-class-files) that extend the Cherrycake's [Items](../../reference/core-classes/items/) core class. Let's say we want to create an Item list class to work with lists of movies. To do so, so we create the `Movies` class in the file `/classes/Movies.class.php`, and it looks like this:



```php
<?php

namespace CherrycakeApp;

class Movies extends \Cherrycake\Items {
    protected $tableName = "movies";
    protected $itemClassName = "\CherrycakeApp\Movie";
}
```

Just by setting these two properties we'll have a working `Movies` class:

* **`tableName`** The name of the table where the items are stored.
* **`itemClassName`** The name of the Item class.

You can also set some other properties if you need to change the defaults:

* **`databaseProviderName`** The database provider name where this items are stored. Defaults to `main`

We're now ready to start retrieving Movie lists from the database. Let's see how we could simply get a list of all the movies on the database:

```php
$movies = new Movies([
    "fillMethod" => "fromParameters",
    "p" => []
]);
echo "{$movies->count()} Movies found";
```

```text
18 Movies found
```

You can automatically fill your Movies object with Movie items when creating it by passing the `fillMethod` key as you see in the example above. 

