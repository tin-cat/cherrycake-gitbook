# CacheProvider methods

## get\( key \)

Gets a value from the cache.

**Parameters:**

* **`key`** The identifier key

**Returns:** The stored value on the specified key, or false if it didn't exist.

## set\( key, value, ttl \)

Stores a value into the cache

**Parameters:**

* **`key`** The identifier key
* **`value`** The value
* **`ttl`** The [Time To Live](../../../guide/cache-guide.md#time-to-live) of the stored value in seconds. Default: `false`

**Returns:** Whether the value has been correctly stored, false otherwise.

