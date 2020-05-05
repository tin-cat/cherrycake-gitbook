# Item lists cache

Item lists are just as easily cacheable as [individual Items](item-cache.md). Just set the `isCache` property to `true` in your Items object definition:

```php
class Movies extends \Cherrycake\Items {
    protected $tableName = "movies";
    protected $itemClassName = "\CherrycakeApp\Movie";
    protected $isCache = true;
}
```

You can also add this other properties if you can to change the default values for caching Items:

* **`cacheProviderName`** The name of the cache provider to use. Default: `engine`
* **`cacheTtl`**: The TTL to use when caching data for this Item. Default: `CACHE_TTL_NORMAL`

Now, all the Movies queried using your `Movies` object will benefit of the caching performance improvements.

## Clearing the cache

There are many situations on which you'll need to clear an Items list cache. For example, whenever a new item is added to the database, you'll need to clear the cache so it will show up the next time the Items list is requested.

To clear an Items list cache, just call the clearCache method passing the same value you passed the `p` key when instantiating your Items object, or when you called the [Items::fillFromParameters](../../reference/core-classes/items/items-methods.md#fillfromparameters) method.

