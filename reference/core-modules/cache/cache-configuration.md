---
description: 'The available configuration keys for this module, and its default values.'
---

# Cache configuration

* **`providers`** A hash array of the available [cache providers](../../../guide/cache-guide.md#cache-providers), where the key is the name of the cache provider, and the value is a hash array with the following possible keys:
  * **`providerClassName`** The name of the cache provider class, from the available ones:
    * `CacheProviderApc`
    * `CacheProviderApcu`
    * `CacheProviderMemcached`
    * `CacheProviderRedis`
  * **`config`** A hash array of configuration options for the cache provider, where each different cache provider has different available config keys:
    * For `CacheProviderApc`: No configuration needed.
    * For `CacheProviderApcu`: No configuration needed.
    * For `CacheProviderMemcached`: 
      * **`isPersistentConnection`**
      * **`isCompression`**
      * **`servers`** An array of the servers to add to the server Memcached pool, as documented in [https://www.php.net/manual/en/memcached.addservers.php](https://www.php.net/manual/en/memcached.addservers.php)
    * For `CacheProviderRedis`:
      * **`scheme`** The connection scheme. Default: `tcp`
      * **`host`** The host name or IP of the Redis server. Default: `localhost`
      * **`port`** The server port. Default: `6379`
      * **`database`** The Redis database number to use. Default: `0`
      * **`prefix`** The prefix to use for all cache keys. Used to avoid key collisions with other apps that might be running in the server. Defaults to none.
      * **`isPersistentConnection`** Whether to keep the connection to Redis active between requests. Default: `true`

