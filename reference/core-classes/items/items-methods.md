# Items methods

## \_\_construct\( setup \) <a id="__construct"></a>

* **`setup`** An optional hash array with the following possible setup keys:
  * **`fillMethod`** Optionally specifies the method to use to load Item objects right on the construction of the object. From one of the following possible method keys:
    * **`fromParameters`** Makes a request to the database with the specification passed via the `p` key and loads the resulting Items.
    * **`fromDatabaseResult`** Loads the Items that you've queried on your own, from the passed `databaseResult` key, using the given `itemLoadMethod` and `keyField`
    * **`fromArray`** Loads the Items passed in the `items` key.
  * **`p`**
  * **`itemLoadMethod`** The method to use to load Items when using the `fromDatabaseResult` `fillMethod`.
  * **`databaseResult`** The DatabaseResult object containing the Items to load when using the `fromDatabaseResult` `fillMethod`.
  * **`keyField`** The field name that uniquely identifies each item on the table to use when loading Items when using the `fromDatabaseResult` `fillMethod`.
  * **`items`** An array of Item objects to load when using the `fromArray` `fillMethod`.

**Throws:** An Exception if the item could not be constructed or loaded.

