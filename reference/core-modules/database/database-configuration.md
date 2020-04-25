# Database configuration



* **`providers`** A hash array of the available [database providers](../../../guide/database-guide.md#database-providers), where the key is the name of the database provider, and the value is a hash array with the following possible keys:
  * **`providerClassName`** The name of the cache provider class, from the available ones:
    * `DatabaseProviderMysql` To connect to MySQL or MariaDB database servers.
  * **`config`** A hash array of configuration options for the database provider, where each different cache provider has different available config keys:
    * For `DatabaseProviderMysql`: 
      * **`host`** The host name or IP of the server.
      * **`user`** The user name
      * **`password`** The password
      * **`database`** The name of the database
      * **`charset`** The character set to use. One of the available here: [https://dev.mysql.com/doc/refman/8.0/en/charset-charsets.html](https://dev.mysql.com/doc/refman/8.0/en/charset-charsets.html).
      * **`cacheKeyPrefix`** The cache prefix to use when caching data from the database. Default: `Database`
      * **`cacheDefaultTtl`** The default [TTL](../../../guide/cache-guide.md#time-to-live) to use when caching data from the database. Default: `CACHE_TTL_NORMAL`
      * **`cacheProviderName`** The default cache provider name to use when caching data from the database. Default: `engine`

