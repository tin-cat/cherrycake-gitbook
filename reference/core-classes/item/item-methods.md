# Item methods

## \_\_construct\( setup \) <a id="__construct"></a>

* **`setup`** An optional hash array with the following possible setup keys:
  * **`loadMethod`** If specified, it loads the Item from the database using the given method, from one of the following available loading methods:
    * `fromDatabaseRow` Loads the item from the given [DatabaseRow](../databaserow.md) object data passed in the `databaseRow` setup key.
    * `fromId` Loads the item identified by the id given in the `id` setup key.
    * `fromData` Loads the item using the data passed in the `data` setup key.
  * **`databaseRow`** The [DatabaseRow](../databaserow.md) object to load the Item from when the `fromDatabaseRow` `loadMethod` is specified.
  * **`id`** The id on the database of the item to load, when the `fromId` `loadMethod` is specified.
  * **`data`** A hash array containing the data of the item to load, when the `fromData` `loadMethod` is specified, where each key is the field name, and its value the field value.

**Throws:** An Exception if the item could not be constructed or loaded.

## \_\_get\( key \) <a id="__get"></a>

Magic method to return the Item's data corresponding to the given `key`

* **`key`** The key of the data to get, matches the database field name.

**Returns:** The data, or null if `key` didn't exist.

## \_\_isset\( key \) <a id="__isset"></a>

Magic method to check whether the given `key` exists in the item.

* **`key`** The key of the data to check, matches the database field name.

**Returns:** `true` if the key exists, `false` if not.

## \_\_set\( key \)

Magic method to set the item data with the given key to the given value

* **`key`** The key of the data to set, matches the database field name.
* **`value`** The value

## loadFromData\( data \)

Loads the item with the given data.

* **`data`** A hash array containing the data of the item, where each key is the field name as defined in the [Item::$fields](item-properties.md#usdfields) property, and each value is the field value.

**Returns:** True on success, false on error.

## loadFromDatabaseRow\( databaseRow \) <a id="loadfromdatabaserow"></a>

Loads the item from the given [DatabaseRow](../databaserow.md).

* **`databaseRow`** A [DatabaseRow](../databaserow.md) object containing the data of the item.

**Returns:** True on success, false on error.

## loadFromId\( id, fieldName method \) <a id="loadfromid"></a>

Loads the item identified by the given `id` from the database.

* **`id`** The id
* **`fieldName`** The name of the field containing the ids, as defined in the [Item::$fields](item-properties.md#usdfields) property. Should be a field that uniquely identifies a row on the database.
* **`method`** The loading method to use. If not specified, it uses the default [Item::$loadFromIdMethod](item-properties.md#loadfromidmethod). One of the following values:
  * `queryDatabaseCache` Load the item from the database using cache.
  * `queryDatabase` Load the item from the database without using cache.

**Returns:** True if the item was found and loaded successfully, false otherwise.

## update\( data \) <a id="update"></a>

Updates the data on the database for this Item with the passed `data`, or with the data stored on the object if no `data` is passed.

* **`data`** An optional hash array where each key is the field name to update, and each value the new data to store on that field for this item. If not passed or left to false, the current data stored in the object is used. Default: `false`
  * For multilanguage fields, a hash array where the keys are language codes and the values are the value in that language can be passed. If a non-array value is passed the currently detected language will be used.

**Returns:** True if everything went ok, false otherwise



