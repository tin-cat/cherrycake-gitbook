# Cache methods

## buildCacheKey\( cacheKeyNamingOptions \) <a id="buildcachekey"></a>

Returns a cache key to uniquely identify a cached object, to be used in caching operations.

* **`cacheKeyNamingOptions`** A hash array of options to build the cache key, with the following possible keys:
  * **`prefix`** A prefix that will added to the beginning of the cache key. Used to prevent collisions.
  * **`uniqueId`** A specifically provided unique identification for the cached object. Used when you want to manually give a unique identifier to a cached object. This overrides any specified `specificPrefix`, `hash` or `key`.
  * **`specificPrefix`** A secondary prefix to further prevent collisions when using `hash` or `key`.
  * **`hash`** A string to be hashed as the cache key instead of using "key". For example: An SQL query.
  * **`key`** An arbitrary key to uniquely identify the cache key.

**Returns:** The cache key in the form of a string.



