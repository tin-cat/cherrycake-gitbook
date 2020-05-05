# Advanced item listings

We've just seen how to retrieve very simple lists of Item objects from the database, but what about when you need to filter the results, join tables, specify extra SQL statements or get an ordered list of Items?

To do so, overload the `fillFromParameters` method of your `Items` class to take care of any additional filtering, ordering or querying you might need for your Item listings.

> The [Items::fillFromParameters](../../reference/core-classes/items/items-methods.md#fillfromparameters) method is in charge of requesting the database and loading the [Item](../../reference/core-classes/item/) objects in the list. It is called internally whenever you create your [Items](../../architecture/items.md) object with a `fromParameters` `fillMethod` , but it can also be called manually after instantiating an object if you need it.

For example, let's say we wanted a way to get movie listings containing only movies released on a specific year. We would overload the `fillFromParameters` method of our `Movies` object to look like this:

```php
class Movies extends \Cherrycake\Items {
    protected $tableName = "movies";
    protected $itemClassName = "\CherrycakeApp\Movie";
    
    function fillFromParameters($p = false) {
        // Treat parameters
        self::treatParameters($p, [
            "year" => [
                "default" => false
            ]
        ]);
        
        // Modify $p accordingly
        if ($p["year"]) {
            $p["wheres"][] = [
                "sqlPart" => "movies.year = ?",
                "values" => [
                    [
                        "type" => \Cherrycake\DATABASE_FIELD_TYPE_INTEGER,
                        "value" => $p["year"]
                    ]
                ]
            ];
        }
        
        // Call the parent fillFromParameters
        return parent::fillFromParameters($p);
    }
    
}
```

There are three important things we did here:

* **Treat parameters:** We use the [BasicObject::treatParameters](../../reference/core-classes/basicobject/basicobject-methods.md#treatparameters-and-usdparameters-usdsetup) method to treat the parameters passed via `$p`. In this case, we simply set up a default value of `false` for the `year` parameter. This way of treating parameters might come specially in handy when you have many parameters with default values and requisites.
* **Modify $p accordingly**: Because we'll be sending the `$p` parameters array to the parent [fillFromParameters](../../reference/core-classes/items/items-methods.md#fillfromparameters) method that does all the work, we compose it now according to our special parameters. In this case, if we've got a `year` parameter, we add a new `where` statement to `$p` that will cause the SQL statement to only request movies from the specified year.
* **Call the parent fillFromParameters:** Because we're overloading the [fillFromParameters](../../reference/core-classes/items/items-methods.md#fillfromparameters) method to add our own Movie-specific logic, we now call the parent [fillFromParameters](../../reference/core-classes/items/items-methods.md#fillfromparameters) method, which is the one that does the actual work.

With this in place, our `Movies` object can now accept requests to retrieve movies from a specific year, like this:

```php
$movies = new Movies([
    "fillMethod" => "fromParameters",
    "p" => [
        "year" => 1968
    ]
]);
foreach ($movies as $movie)
    echo "{$movie->title} ({$movie->year})\n";
```

```text
2001: A Space Odyssey (1968)
Planet of the Apes (1968)
```

\*\*\*\*

