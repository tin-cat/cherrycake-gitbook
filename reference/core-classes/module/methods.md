# Module / Methods

## getConfig\( key \)

Gets a configuration value.

**Parameters**

* **`key`** The configuration key

**Returns:** The configuration value.

## init

Initializes the module, called automatically when the module is loaded. Contains any specific initialization for the module, and any required loading of modules and classes dependencies.

**Returns:** A boolean specifying whether the module was initialized ok or failed.

## mapActions

Maps the Actions to which this module must respond. Intended to contain calls to Actions::mapAction\(\)

