# SystemLogEvent methods

## getEventDescription

Builds the event description, if it has more complexity than just the event class name. Intended to be overladed.

**Returns:** A detailed description of the currently loaded event.

## loadInline\( data \) <a id="loadinline"></a>

Inherited from the Item class, loads the item when no loadMethod has been provided on construction. Intended to be overloaded for events that require extra complexity. This is the usual way of creating LogEvent objects for logging.

* **`data`** A hash array with the event data.

**Returns:** `true` on success, `false` on failure.

