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
2001: A Space Odyssey (1968)
Planet of the Apes (1968)
```



