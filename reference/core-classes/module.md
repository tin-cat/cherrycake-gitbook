# Module

## $config

Holds the default configuration for this module

## $dependentCoreModules

An array of strings specifying the Core module names that are required by this module.

## $dependentAppModules

An array of strings specifying the App module names that are required by this module.

Gets a configuration value.

**Parameters**

* `key` The configuration key

**Returns:** The configuration value.

## $isConfigFile

Whether this module has its own configuration file.

**Default:** false

## $isConfigFileRequired

Whether the config file for this module is required to run the app.

**Default:** false

## getConfig\( key \)

## init

Initializes the module, called automatically when the module is loaded. Contains any specific initialization for the module, and any required loading of modules and classes dependencies.

**Returns:** A boolean specifying whether the module was initialized ok or failed.

## mapActions

Maps the Actions to which this module must respond. Intended to contain calls to Actions::mapAction\(\)

