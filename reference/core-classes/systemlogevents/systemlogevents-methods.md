# SystemLogEvents methods

## fillFromParameters\( p \) <a id="fillfromparameters"></a>

Overloads the [Items::fillFromParameters](../items/items-methods.md#fillfromparameters) method to provide an easy way to load [SystemLogEvent](../systemlogevent/) items when instantiating this class.

* **`p`** Specifications on how to fill the [SystemLogEvents](./) object, with the possible keys below plus any other setup keys from [Items::fillFromParameters](../items/items-methods.md#fillfromparameters), or an array of [SystemLogEvent](../systemlogevent/) objects to fill the list with.
  * **`type`** The class name of the [SystemLogEvent](../systemlogevent/) objects to get.
  * **`fromTimestamp`** Get [SystemLogEvent](../systemlogevent/) items added starting on this timestamp.
  * **`toTimestamp`** Get [SystemLogEvent](../systemlogevent/) items added up to this timestamp.

**Returns:** `true` if everything went ok, `false` otherwise.

