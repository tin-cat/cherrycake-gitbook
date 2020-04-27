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

## $fields <a id="fields"></a>

Hash array specification of the fields on the database table for this item class, where each key is the field name and the value is a hash array with the following keys:

* **`type`** The type of the field, one of the available DATABASE\_FIELD\_TYPE\_\*
* **`formItem`**
* **`isMultiLanguage`**
* **`title`**
* **`prefix`**
* **`postfix`**
* **`multiplier`**
* **`decimals`**
* **`humanizeMethodName`**
* **`humanizePreMethodName`**
* **`humanizePostMethodName`**
* **`representFunction`**
* **`requestSecurityRules`**
* **`requestFilters`**
* **`validationMethod`**

## $idFieldName <a id="idfieldname"></a>

The name of the field on the table that uniquely identifies this item on the database table with a numeric id. It should be an auto-increment field.

**Default:** `id`

## $loadFromIdMethod <a id="loadfromidmethod"></a>

The method to use when loading this item from the database via an index. Possible values:

* `queryDatabaseCache` Load the item from the database using cache.
* `queryDatabase` Load the item from the database without using cache.

**Default:** `queryDatabase`

## $metaFields <a id="metafields"></a>



## $tableName <a id="tablename"></a>

The name of the database table where this items are stored.





