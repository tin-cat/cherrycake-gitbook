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

## loadFromId\( id, fieldName method \) <a id="loadfromid"></a>

Loads the item identified by the given `id` from the database.

* **`id`** The id
* **`fieldName`** The name of the field containing the ids, as defined in the [Item::$fields](item-properties.md#usdfields) property.
* **`method`**

