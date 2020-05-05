# Items custom ordering

Just like the way you [customize filters](items-custom-filters.md) in your Items object, you can also create custom orders to get ordered Item lists.

Let's say you want to be able to get movie lists ordered by release date. You would overload the [fillFromParameters](../../reference/core-classes/items/items-methods.md#fillfromparameters) method of your [Items](../../reference/core-classes/items/) object like this:

```php
class Movies extends \Cherrycake\Items {
    protected $tableName = "movies";
    protected $itemClassName = "\CherrycakeApp\Movie";
    
    function fillFromParameters($p = false) {
        // Treat parameters
        self::treatParameters($p, [
            "orders" => ["addArrayKeysIfNotExist" => [
                "chronological" => "streams.creationDate desc"
            ]]
    		]);
        
        // Call the parent fillFromParameters
        return parent::fillFromParameters($p);
    }
}
```

