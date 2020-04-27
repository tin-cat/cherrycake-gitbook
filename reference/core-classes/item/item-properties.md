# Item properties

## $cacheProviderName <a id="cacheprovidername"></a>

The name of the cache provider to use.

**Default:** `engine`

## $cacheTtl

The TTL for the cache storage.

**Default:** `CACHE_TTL_NORMAL`

## $cacheSpecificPrefix <a id="cachespecificprefix"></a>

The string to use as the key for this Item in the cache, the value of the idFieldName will be appended.

## $databaseProvider <a id="databaseprovider"></a>

The name of the database provider to use when querying the database for this item.

**Default:** `main`

## $idFieldName <a id="idfieldname"></a>

The name of the field on the table that uniquely identifies this item on the database table with a numeric id. It should be an auto-increment field.

**Default:** `id`

## $loadFromIdMethod <a id="loadfromidmethod"></a>

The method to use when loading this item from the database via an index. Possible values:

* `queryDatabaseCache`
* `queryDatabase`

**Default:** `queryDatabase`

## $tableName <a id="tablename"></a>

The name of the database table where this items are stored.




