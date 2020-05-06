# Items properties

## cachedKeysPoolName

The CachedKeysPool mechanism allows for the wiping of multiple cached queries at once that are related to the same Items set.

When a `cachedKeyPoolsName` is specified, all the cache keys for queries performed by this Items object will be remembered in an internal pool. So, when executing the clearCachedKeysPool \(executes also on the clearCache method\), all the cached queries performed by this Items object will be cleared.

For example, when we have an Items object that gets certain items lists by accepting a page parameter for paged results, we don't know in advance how many pages will be cached, nor which pages will be cached, hence preventing us from easily clearing all the cached queries \(since each cached items set will have an uncertain cache key that should contain the page number\). The CachedKeysPool mechanism adds all the used cache keys to the pool as soon as they're used, so we end having a list of all the used cache keys. The clearCachedKeysPool method loops through that list and removes all the cache entries corresponding to each stored key from cache, effectively clearing all the cached queries related to this Items object.

It uses the same `cacheProviderName` as the rest of the Items functionalities.

**Default:** `false`

## cacheProviderName

The name of the cache provider to use on the fillFromParameters method.

**Default:** `engine`

## databaseProviderName

The database provider name to use on the fillFromParameters method.

**Default:** `main`

## isCache

Whether to cache the result or not on the fillFromParameters method.

**Default:** `false`

## itemClassName

The name of the Item class to use.

## tableName

The name of the table where this items reside on the database.

