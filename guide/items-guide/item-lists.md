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
30 Movies found
```

You can automatically fill your `Movies` object with `Movie` items when creating it by passing the `fillMethod` key as you see in the example above.

> Since we're not specifying any parameters in the `p` key, we'll simply get all movies in the database at once.

> This example is implemented in the [Cherrycake documentation examples repository](https://github.com/tin-cat/cherrycake-documentation-examples), in the `ItemsGuide` module, and runs by requesting the URL `/items-guide/item-lists`

Let's see how we could iterate through the results to show all the movie titles and their release years:

```php
foreach ($movies as $movie)
    echo "{$movie->title} ({$movie->year})\n";
```

```text
Alien (1979)
The Thing (1982)
Silent Running (1972)
Arrival (2016)
Interstellar (2014)
Ex Machina (2014)
2001: A Space Odyssey (1968)
The Martian (2015)
Planet of the Apes (1968)
Moon (2009)
Contact (1997)
The Man from Earth (2007)
Dune (1984)
Blade Runner (1982)
Brainstorm (1983)
The Hitchhiker’s Guide to the Galaxy (2005)
Blade Runner 2049 (2017)
Prometheus (2012)
The Last Starfighter (1984)
Enemy Mine (1985)
Explorers (1985)
Tron (1982)
WarGames (1983)
Close Encounters of the Third Kind (1977)
The War of the Worlds (1953)
The Day the Earth Stood Still (1951)
E.T. the Extra-Terrestrial (1982)
The Abyss (1989)
War of the Worlds (2005)
Super 8 (2011)
```

> This example is implemented in the [Cherrycake documentation examples repository](https://github.com/tin-cat/cherrycake-documentation-examples), in the `ItemsGuide` module, and runs by requesting the URL `/items-guide/iterate`

## Limit results

To get only the first `n` results instead of all of them, you can specify the `limit` key when creating your `Movies` object, like this:

```php
$movies = new Movies([
    "fillMethod" => "fromParameters",
    "p" => [
        "limit" => 3
    ]
]);

foreach ($movies as $movie)
    echo "{$movie->title} ({$movie->year})\n";
```

```text
Alien (1979)
The Thing (1982)
Silent Running (1972)
```

## Results pagination

There's also a simple way of paginating results by specifying the `itemsPerPage` and `page` keys. Let's say you're dividing your movie listing in pages containing five movies each, and you want to get the third page. You would do it like this:

```php
$movies = new Movies([
    "fillMethod" => "fromParameters",
    "p" => [
        "isPaging" => true,
        "itemsPerPage" => 5,
        "page" => 2
    ]
]);

foreach ($movies as $movie)
    echo "{$movie->title} ({$movie->year})\n";
```

```text
Contact (1997)
The Man from Earth (2007)
Dune (1984)
Blade Runner (1982)
Brainstorm (1983)
```

> Remember that pages start at zero, not at 1.

## Iterating Items in a pattern

Since we already learned how to [pass variables to a pattern](../patterns-guide/passing-variables-to-a-pattern.md), why don't we pass the `$movies` object to a pattern, and iterate it there to create a nice `<UL>` list? This is how it can be done:

We output the pattern using the [Patterns::out](../../reference/core-modules/patterns/methods.md#out) method, passing the `$movies` variable along:

```php
$movies = new Movies([
    "fillMethod" => "fromParameters",
    "limit" => 5
]);

$e->Patterns->out("MoviesList.html", [
    "variables" => [
        "movies" => $movies
    ]
]);
```

We create the pattern `MoviesList.html` like this:

```markup
<html><body>

<ul>
    <?php foreach ($movies as $movie) { ?>
        <li><?=$movie->title?> (<?=$movie->year?>)</li>
    <?php } ?>
</ul>

</body></html>
```

And this is the result:

{% tabs %}
{% tab title="Browser" %}
* Alien \(1979\)
* The Thing \(1982\)
* Silent Running \(1972\)
* Arrival \(2016\)
* Interstellar \(2014\)
{% endtab %}
{% endtabs %}

> This example is implemented in the [Cherrycake documentation examples repository](https://github.com/tin-cat/cherrycake-documentation-examples), in the `ItemsGuide` module, and runs by requesting the URL `/items-guide/iterate-in-pattern`

