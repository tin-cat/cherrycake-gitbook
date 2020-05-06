# Items methods

## \_\_construct\( setup \) <a id="__construct"></a>

* **`setup`** An optional hash array with the following possible setup keys:
  * **`fillMethod`** Optionally specifies the method to use to load Item objects right on the construction of the object. From one of the following possible method keys:
    * **`fromParameters`** Makes a request to the database with the specification passed via the `p` key and loads the resulting Items.
    * **`fromDatabaseResult`** Loads the Items that you've queried on your own, from the passed `databaseResult` key, using the given `itemLoadMethod` and `keyField`
    * **`fromArray`** Loads the Items passed in the `items` key.
  * **`p`** A hash array with the parameters to use for loading Items when the `fromParameters` `fillMethod` is used, the same as in the [fillFromParameters](items-methods.md#fillfromparameters) method.
  * **`itemLoadMethod`** The method to use to load Items when using the `fromDatabaseResult` `fillMethod`.
  * **`databaseResult`** The DatabaseResult object containing the Items to load when using the `fromDatabaseResult` `fillMethod`.
  * **`keyField`** The field name that uniquely identifies each item on the table to use when loading Items when using the `fromDatabaseResult` `fillMethod`.
  * **`items`** An array of Item objects to load when using the `fromArray` `fillMethod`.

**Throws:** An Exception if the item could not be constructed or loaded.

## buildCacheKeyNamingOptions\( p \) <a id="buildcachekeynamingoptions"></a>

Builds a suitable `cacheKeyNamingOptions` array for performing queries and also clearing cache. Takes the same parameters as the [fillFromParameters](items-methods.md#fillfromparameters) method. Intended to be overloaded.

* **`p`** A hash array of options, with the same specs as the one passed to the [fillFromParameters](items-methods.md#fillfromparameters) method. Only the relevant keys will be used.

**Returns:** A `cacheKeyNamingOptions` hash array suitable to be used when performing queries to the database or clearing the queries cache.

## clearCache\( p \)

Clears the cache for the query represented by the given `p` parameters, just as they were passed to [buildCacheKeyNamingOptions](items-methods.md#buildcachekeynamingoptions), the [constructor](items-methods.md#__construct) or, most probably, the [fillFromParameters](items-methods.md#fillfromparameters) method.

* **`p`** A hash array of parameters that will be used to build the cache key to clear, so it has to be the same as the parameters passed to [buildCacheKeyNamingOptions](items-methods.md#buildcachekeynamingoptions) \(and also to [fillFromParameters](items-methods.md#fillfromparameters), and to the [constructor](items-methods.md#__construct), if that's the case\)

**Returns:** True if cache was cleared successfully, false otherwise

## clearCachedKeysPool

When using the CachedKeysPool mechanism, this method removes all the cache entries corresponding to each stored key from cache, effectively clearing all the cached queries related to this Items object.

**Returns:** True if the cachedKeysPool could be cleared, false otherwise

## fillFromParameters\( p \) <a id="fillfromparameters"></a>

Fills the list with items loaded according to the given parameters. Intended to be overloaded and called from a parent class.

* **`p`** A hash array with parameters for loading Items
  * **`keyField`** The name of the field on the database table that uniquely identifies each item, most probably the primary key. Default: `id`
  * **`selects`** An array of select SQL parts to select from. Example: `["tableName.*", "tableName2.id"]`. Default: All fields from the object's `tableName`.
  * **`tables`** An array of tables to be used on the SQL query. Default: This object's `tableName`.
  * **`wheres`** An array of `where` SQL clauses. Default: `false`. Each item is a hash array containing the following keys:
    * **`sqlPart`** The SQL part of the where, on which each value must represented by a question mark. Example: `fieldName = ?`
    * **`values`** An array specifying each of the values used on the `sqlPart`, in the same order they're used there. Each item of the array must an array of the following keys:
      * **`type`** The type of the value, must be one of the [`DATABASE_FIELD_TYPE_?`](../../core-modules/database.md#constants)
      * **`value`** The value
  * **`limit`** Maximum number of items returned. Default: `false`
  * **`order`** An ordered array of orders to apply to results, on which each item can be one of the configured in the `orders` parameter. Default: `false`
  * **`orders`** A hash array of the available orders to be applied to results, where each key is the order name as used in the `order` parameter, and the value is the SQL order part. Default: A `random` order that randomizes results order when used.
  * **`orderRandomSeed`** The seed to use to randomize results when the `random` order is used. Default: `false`
  * **`isPaging`** Whether to page results based on the given `page` and `itemsPerPage` parameters. Default: `false`
  * **`page`** The number of page to return when paging is active. Default: `0`
  * **`itemsPerPage`** The number of items per page when paging is active. Default: `10`
  * **`isBuildTotalNumberOfItems`** Whether to return the total number of matching items or not in the `totalNumberOf` results key, not taking into account paging configuration. It takes into account `limit`, if specified. Default: `false`
  * **`isFillItems`** Whether to return the matching items or not in the `items` results key. Default: `true`
  * **`isForceNoCache`** If set to true, the query won't use cache, even if the object is configured to do so. Default: `false`
  * **`cacheKeyNamingOptions`** If specified, this cacheKeyNamingOptions will be used instead of the ones built by the buildCacheKeyNamingOptions method. The cache key naming options as specified in [Cache::buildCacheKey](../../core-modules/cache/cache-methods.md#buildcachekey). Default: `false`
  * **`isStoreInCacheWhenNoResults`** Whether to store results in cache even when there are no results. Default: `true`

**Returns:** True if everything went ok, false otherwise.

