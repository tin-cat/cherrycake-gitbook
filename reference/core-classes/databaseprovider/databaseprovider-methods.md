# DatabaseProvider methods

## execute\( prepareResult, parameters \) <a id="execute"></a>

Executes a previously prepared query with the given parameters.

* **`prepareResult`** The prepare result as returned by the [DatabaseProvider::prepare](databaseprovider-methods.md#prepare) method.
* **`parameters`** A hash array with the variables to be applied to the prepared result, in the same order as they are stated in the original SQL statement, where each item in the array is a hash array with the following keys:
  * **`type`** One of the available [database field type constants](../../core-modules/database.md#constants), like `DATABASE_FIELD_TYPE_INTEGER`
  * **`value`** The value of the variable.

## prepare\( sql \) <a id="prepare"></a>

Prepares a query so it can be later executed as a prepared query with the [DatabaseProvider::execute](databaseprovider-methods.md#execute) method.

* **`sql`** The SQL statement to prepare to be queried to the database, where all the variables are replaced by question marks.

**Returns:** A hash array with the following keys:

* **`sql`** The passed SQL statement.
* **`statement`** A provider-specific statement object if the query has been prepared correctly, false otherwise.

## prepareAndExecute\( sql, parameters, setup \) <a id="prepareandexecute"></a>

Prepares and executes a prepared query

* **`sql`** The prepared SQL statement.
* **`parameters`** A hash array with the variables to be applied to the prepared SQL statement, in the same order as they are stated in the SQL, with the same structure as in the [DatabaseProvider::execute](databaseprovider-methods.md#execute-prepareresult-parameters) method.
* **`setup`** Optional hash array with options, same specification as [DatabaseResult::$setup](../databaseresult/databaseresult-properties.md#usdsetup)

**Returns:** A [DatabaseResult](../databaseresult/) object if the query was executed correctly, false otherwise.

## query\( query, setup \) <a id="query"></a>

Performs a query to the database.

* **`query`** The SQL query string
* **`setup`** An optional hash array with setup options.

## queryCache\( sql, cacheTtl, cacheKeyNamingOptions, overrideCacheProviderName, isStoreInCacheWhenNoResults, setup \) <a id="querycache"></a>

Performs a query to the database implementing a caching mechanism. If the query results are stored in the cache, it retrieves them. If not in cache, it performs the query and stores the results in cache.

* query The SQL statement.
* cacheTtl The TTL for the cache results. If not specified, the configuration value cacheDefaultTtl is used.
* cacheKeyNamingOptions An optional hash array with the cache key naming options. Cache::buildCacheKey
* overrideCacheProviderName If specified, the cache provider with this name will be used instead of the one in the Database configuration.
* isStoreInCacheWhenNoResults
* setup

