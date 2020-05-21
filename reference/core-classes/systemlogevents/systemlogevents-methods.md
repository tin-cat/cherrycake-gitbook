---
description: Class that represents a list of SystemLogEvent objects.
---

# SystemLogEvents methods

## fillFromParameters\( p \) <a id="fillfromparameters"></a>

Overloads the [Items::fillFromParameters](../items/items-methods.md#fillfromparameters) method to provide an easy way to load [SystemLogEvent](../systemlogevent/) items on instantiating this class.

* **`p`** Specifications on how to fill the [SystemLogEvents](./) object, with the possible keys below plus any other setup keys from [Items::fillFromParameters](../items/items-methods.md#fillfromparameters), or an array of [SystemLogEvent](../systemlogevent/) objects to fill the list with.
  * **`type`** The class name of the SystemLogEvent objects to get.
  * **`fromTimestamp`** Get SystemLogEvent items added starting on this timestamp.
  * **`toTimestamp`** Get SystemLogEvent items added up to this timestamp.

