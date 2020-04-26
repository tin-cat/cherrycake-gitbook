# Database

## Configuration

* **`providers`** A hash array of the available [database providers](../../guide/database-guide/#database-providers), where the key is the name of the database provider, and the value is a hash array with the following possible keys:
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
      * **`cacheDefaultTtl`** The default [TTL](../../guide/cache-guide/#time-to-live) to use when caching data from the database. Default: `CACHE_TTL_NORMAL`
      * **`cacheProviderName`** The default cache provider name to use when caching data from the database. Default: `engine`

## Constants

* **`DATABASE_FIELD_TYPE_INTEGER`**
* **`DATABASE_FIELD_TYPE_TINYINT`**
* **`DATABASE_FIELD_TYPE_FLOAT`**
* **`DATABASE_FIELD_TYPE_DATE`**
* **`DATABASE_FIELD_TYPE_DATETIME`**
* **`DATABASE_FIELD_TYPE_TIMESTAMP`**
* **`DATABASE_FIELD_TYPE_TIME`**
* **`DATABASE_FIELD_TYPE_YEAR`**
* **`DATABASE_FIELD_TYPE_STRING`**
* **`DATABASE_FIELD_TYPE_TEXT`**
* **`DATABASE_FIELD_TYPE_BLOB`**
* **`DATABASE_FIELD_TYPE_BOOLEAN`**
* **`DATABASE_FIELD_TYPE_IP`**
* **`DATABASE_FIELD_TYPE_SERIALIZED`**
* **`DATABASE_FIELD_TYPE_COLOR`**

\*\*\*\*

* **`DATABASE_FIELD_DEFAULT_VALUE`**
* **`DATABASE_FIELD_DEFAULT_VALUE_DATE`**
* **`DATABASE_FIELD_DEFAULT_VALUE_DATETIME`**
* **`DATABASE_FIELD_DEFAULT_VALUE_TIMESTAMP`**
* **`DATABASE_FIELD_DEFAULT_VALUE_TIME`**
* **`DATABASE_FIELD_DEFAULT_VALUE_YEAR`**
* **`DATABASE_FIELD_DEFAULT_VALUE_IP`**
* **`DATABASE_FIELD_DEFAULT_VALUE_AVAILABLE_URL_SHORT_CODE`**

