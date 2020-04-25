# Cache

{% tabs %}
{% tab title="Configuration" %}
* **`providers`** A hash array of the available [cache providers](../../guide/cache-guide.md#cache-providers), where the key is the name of the cache provider, and the value is a hash array with the following possible keys:
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
{% endtab %}

{% tab title="Constants" %}
* `CACHE_TTL_1_MINUTE`
* `CACHE_TTL_5_MINUTES`
* `CACHE_TTL_10_MINUTES`
* `CACHE_TTL_30_MINUTES`
* `CACHE_TTL_1_HOUR`
* `CACHE_TTL_2_HOURS`
* `CACHE_TTL_6_HOURS`
* `CACHE_TTL_12_HOURS`
* `CACHE_TTL_1_DAY`
* `CACHE_TTL_2_DAYS`
* `CACHE_TTL_3_DAYS`
* `CACHE_TTL_5_DAYS`
* `CACHE_TTL_1_WEEK`
* `CACHE_TTL_2_WEEKS`
* `CACHE_TTL_1_MONTH`



* `CACHE_TTL_MINIMAL` 10 seconds
* `CACHE_TTL_CRITICAL` 1 minute
* `CACHE_TTL_SHORT` 5 minutes
* `CACHE_TTL_NORMAL` 1 hour
* `CACHE_TTL_UNCRITICAL` 1 day
* `CACHE_TTL_LONG` 1 week
* `CACHE_TTL_LONGEST` 1 month
{% endtab %}

{% tab title="Methods" %}

{% endtab %}
{% endtabs %}

