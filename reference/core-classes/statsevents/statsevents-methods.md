# StatsEvents methods

## fillFromParameters\( p \) <a id="fillfromparameters"></a>

Overloads the [Items::fillFromParameters](../items/items-methods.md#fillfromparameters) method to provide an easy way to load [StatsEvent](../statsevent/) items when instantiating this class.

* **`p`** Specifications on how to fill the [StatsEvents](./) object, with the possible keys below plus any other setup keys from [Items::fillFromParameters](../items/items-methods.md#fillfromparameters), or an array of [StatsEvent](../statsevent/) objects to fill the list with.
  * **`type`** The class name of the StatsEvent objects to get.
  * **`fromTimestamp`** The starting timestamp for the time frame to get StatsEvent objects from.
  * **`toTimestamp`** The finishing timestamp for the time frame to get StatsEvent objects from.

**Returns:** `true` if everything went ok, `false` otherwise.

