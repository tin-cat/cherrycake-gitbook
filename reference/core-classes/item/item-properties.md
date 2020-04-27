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

* **`type`** The type of the field, one of the available [DATABASE\_FIELD\_TYPE\_?](../../core-modules/database.md#constants)
* **`formItem`** A hash array containing the specification of this field when used in forms. Used by [ItemAdmin](../../core-modules/itemadmin.md).
  * **`type`** The type of the form item, one of the available [FORM\_ITEM\_TYPE\_?](../../core-modules/itemadmin.md#constants)
  * **`selectType`** When using the `FORM_ITEM_TYPE_SELECT` `type`, the select type, from one of the following available values:
    * `FORM_ITEM_SELECT_TYPE_RADIOS`
    * `FORM_ITEM_SELECT_TYPE_COMBO`
  * **`items`** When using the `FORM_ITEM_TYPE_SELECT` `type`, a hash array of the items available to be selected, where each key is the field value, and each value is a hash array with the following possible keys:
    * **`title`** The title of the select option
    * **`subTitle`** The subtitle of the select option
* **`isMultiLanguage`**Whether this field stores multi-language data, meaning there are more than one actual fields on the database, one for each available language. As configured in the [Locale](../../core-modules/locale.md) module's setup key `availableLanguages`
* **`title`** The title of the field, to be used when representing data on UI components like UiComponentTableAdmin.
* **`prefix`** The prefix string to add when humanizing the field value. For example: `USD` for american dollar quantities like `USD300`
* **`postfix`** The postfix string to add when humanizing the field value. For example: `º` for values in degrees like `32º`
* **`multiplier`** A multiplier to apply when humanizing the field value.
* **`decimals`** The number of decimals to show when humanizing the field value
* **`humanizeMethodName`** A method name to call to humanize the field value. It will receive the Item object as the first and only parameter. If this returns something other than null, the returned value will be used and any other humanizing method and configs like `prefix`, `postfix`, `multiplier`, `decimals`, etc will be omitted.
* **`humanizePreMethodName`** A method name to call with the field value before any other humanization is done. It will receive the Item object as the first and only parameter.
* **`humanizePostMethodName`** A method name to call with the field value after any other humanization is done. It will receive the already treated value as the first parameter and the [Item](./) object as the second.
* **`representFunction`** An anonymous function that will receive the [Item](./) object. The returned value will be shown to represent this field current value in UI components such as UiComponentItemAdmin when used in conjunction with [ItemAdmin](../../core-modules/itemadmin.md).
* **`requestSecurityRules`** An array of security rules from the available [SECURITY\_RULE\_?](../../core-modules/security/#rules) that should be applied whenever receiving values for this field in a request, just like the [RequestParameter](../requestparameter/) class accepts. Used for example in [ItemAdmin](../../core-modules/itemadmin.md).
* **`requestFilters`** An array of filter from the available [SECURITY\_FILTER\_?](../../core-modules/security/#filters) that should be applied whenever receiving values for this field in a request, just like the [RequestParameter](../requestparameter/) class accepts. Used for example in [ItemAdmin](../../core-modules/itemadmin.md).
* **`validationMethod`** An anonymous function to validate the received value for this field, or an array where the first element is the class name, and the second the method name, just like the `call_user_func` PHP function would expect it. Must return an AjaxResponse object. Used for example in [ItemAdmin](../../core-modules/itemadmin.md).

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





