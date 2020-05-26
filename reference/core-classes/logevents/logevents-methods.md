# LogEvents methods

## fillFromParameters\( p \) <a id="fillfromparameters"></a>

Overloads the [Items::fillFromParameters](../items/items-methods.md#fillfromparameters) method to provide an easy way to load [LogEvent](../logevent/) items when instantiating this class.

* **`p`** Specifications on how to fill the [LogEvents](./) object, with the possible keys below plus any other setup keys from [Items::fillFromParameters](../items/items-methods.md#fillfromparameters), or an array of [LogEvent](../logevent/) objects to fill the list with.
  * **`type`** The class name of the [LogEvent](../logevent/) objects to get.
  * **`fromTimestamp`** Get [LogEvent](../logevent/) items added starting on this timestamp.
  * **`toTimestamp`** Get [LogEvent](../logevent/) items added up to this timestamp.

**Returns:** `true` if everything went ok, `false` otherwise.

