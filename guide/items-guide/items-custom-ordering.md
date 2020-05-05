# Items custom ordering

Just like the way you [customize filters](items-custom-filters.md) in your Items object, you can also create custom orders to get ordered Item lists.

Let's say you want to be able to get movie lists ordered by the year they were released, from older to newer. You would overload the fillFromParameters method of your [Items](../../reference/core-classes/items/) object like this:

```php
class Movies extends \Cherrycake\Items {
    protected $tableName = "movies";
    protected $itemClassName = "\CherrycakeApp\Movie";
    
    function fillFromParameters($p = false) {
        // Treat parameters
        self::treatParameters($p, [
            "orders" => ["addArrayKeysIfNotExist" => [
                "released" => "movies.year asc"
            ]]
    		]);
        
        // Call the parent fillFromParameters
        return parent::fillFromParameters($p);
    }
}
```

This time, the only modification we did was to add a new ordering method to the [`orders`](../../reference/core-classes/items/items-methods.md#fillfromparameters) `$p` parameter. Our ordering method is called `released`, and the SQL part responsible of the ordering is `movies.year desc`.

In the example we're using the [BasicObject::treatParameters](../../reference/core-classes/basicobject/basicobject-methods.md#treatparameters-and-usdparameters-usdsetup) helper method that allows us to treat parameter hash arrays like `$p` more easily, specially when you have lots many parameters to treat.

> Without using [treatParameters](../../reference/core-classes/basicobject/basicobject-methods.md#treatparameters-and-usdparameters-usdsetup), `$p["orders"]["released"] = "movies.year asc";` would've done almost the same.

And that's it, now we can use the Movies class to retrieve lists of movies ordered by their release year like this:

```php
$movies = new Movies([
    "fillMethod" => "fromParameters",
    "p" => [
        "order" => ["released"]
    ]
]);

foreach ($movies as $movie)
    echo "{$movie->title} ({$movie->year})\n";
```

```text
The Day the Earth Stood Still (1951)
The War of the Worlds (1953)
2001: A Space Odyssey (1968)
Planet of the Apes (1968)
Silent Running (1972)
Close Encounters of the Third Kind (1977)
Alien (1979)
The Thing (1982)
Blade Runner (1982)
Tron (1982)
E.T. the Extra-Terrestrial (1982)
Brainstorm (1983)
WarGames (1983)
Dune (1984)
The Last Starfighter (1984)
Enemy Mine (1985)
Explorers (1985)
The Abyss (1989)
Contact (1997)
The Hitchhiker’s Guide to the Galaxy (2005)
War of the Worlds (2005)
The Man from Earth (2007)
Moon (2009)
Super 8 (2011)
Prometheus (2012)
Interstellar (2014)
Ex Machina (2014)
The Martian (2015)
Arrival (2016)
Blade Runner 2049 (2017)
```

> Note that, when instantiating the Movies object, the order `key` is an array. This is because we can pass more than one orders to get lists ordered by multiple criteria at the same time. For example, ordering movies first by their release year, and then by their title. Take a look at [Mixing filters and ordering](mixing-filters-and-ordering.md) for an example.

