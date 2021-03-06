# Item lists cache

Item lists are just as easily cacheable as [individual Items](item-cache.md). Just set the `isCache` property to `true` in your Items object definition:

```php
class Movies extends \Cherrycake\Items {
    protected $tableName = "movies";
    protected $itemClassName = "\CherrycakeApp\Movie";
    protected $isCache = true;
    
    ...
}
```

You can also add this other properties if you can to change the default values for caching Items:

* **`cacheProviderName`** The name of the cache provider to use. Default: `engine`
* **`cacheTtl`** The TTL to use when caching data for this Item. Default: `CACHE_TTL_NORMAL`

Now, all the Movies queried using your `Movies` object will benefit of the caching performance improvements.

## Clearing Items specific cache

There are many situations on which you'll need to clear an Items list cache. For example, whenever a new item is added to the database, you'll need to clear the cache so the new item it will show up the next time the Items list is requested.

To clear an Items list cache, just call the clearCache method passing the same value you passed the `p` key when instantiating your Items object, or when you called the [Items::fillFromParameters](../../reference/core-classes/items/items-methods.md#fillfromparameters) method.

For example, let's take the [last example](mixing-filters-and-ordering.md) of our Movies object, where we've got a list of movies released in the 80's, ordered by release year and title:

```php
$movies = new Movies([
    "fillMethod" => "fromParameters",
    "p" => [
        "minYear" => 1980,
        "maxYear" => 1989,
        "order" => ["released", "title"]
    ]
]);
```

If we wanted to clear the cache for this specific request, we would do this:

```php
$movies->clearCache([
        "minYear" => 1980,
        "maxYear" => 1989,
        "order" => ["released", "title"]
]);
```

## Clearing Items global cache with the CachedKeysPool mechanism

But what if we wanted to clear all the cached requests an Items object has done? Clearing the Items cache for a specific request like we did above does not clears the cache for requests with different parameters.

> Clearing the cache for movies released between 1980 and 1989 like we did above will not clear the cache for movies between different years, or ordered differently.

This is solved by activating the CachedKeysPool mechanism of our Items object, which will keep track of the cache keys of all the requests made, and will allow us to clear them all at once by calling the [clearCachedKeysPool](../../reference/core-classes/items/items-methods.md#clearcachedkeyspool) method.

To activate the CachedKeysPool mechanism, we set the [cachedKeysPoolName](../../reference/core-classes/items/items-properties.md#cachedkeyspoolname) property of our `Items` class to some pool name to identify this Item's cached keys, like so:

```php
class Movies extends \Cherrycake\Items {
    protected $tableName = "movies";
    protected $itemClassName = "\CherrycakeApp\Movie";
    protected $isCache = true;
    protected $cachedKeysPoolName = "movies";
    
    ...
    
}
```

So from now on, calling the [clearCachedKeysPool](../../reference/core-classes/items/items-methods.md#clearcachedkeyspool) method will ensure all the cache related to queries performed using the `Movies` object are cleared:

```php
$movies->clearCachedKeysPool();
```

