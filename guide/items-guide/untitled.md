# Complex item listings

We've just seen how to retrieve very simple lists of Item objects from the database, but what about when you need to filter the results, join tables, specify extra SQL statements or get an ordered list of Items?

To do so, overload the `fillFromParameters` method of your `Items` class to take care of any additional filtering, ordering or querying you might need for your Item listings.

> The [Items::fillFromParameters](../../reference/core-classes/items/items-methods.md#fillfromparameters) method is in charge of requesting the database for your [Item](../../reference/core-classes/item/) objects and loading them. It is called internally whenever you instantiate your [Items](../../architecture/items.md) object, but it can also be called manually after instantiating an object if you need it.

For example, let's say we wanted a way to get movie listings containing only movies released on a specific year. We would overload the `fillFromParameters` method of our `Movies` object to look like this:

```php
class Movies extends \Cherrycake\Items {
    protected $tableName = "movies";
    protected $itemClassName = "\CherrycakeApp\Movie";
    
    function fillFromParameters($p = false) {
        self::treatParameters($p, [
            "year" => [
                "default" => false
            ]
        ]);
        
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
        
        return parent::fillFromParameters($p);
    }
    
}
```

