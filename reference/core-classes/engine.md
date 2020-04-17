# Engine

## attendWebRequest

Attends the request received from a web server by calling Actions::run with the requested URI string

## end

Ends the application by calling the `end` methods of all the loaded modules.

## init\( setup \)

Initializes the Cherrycake engine

**Parameters**

* `setup` Hash array
  * `namespace` The app namespace
  * `baseCherrycakeModules` An ordered array of the base Cherrycake module names that have to be always loaded on application start. These must include at least the [Actions](../core-modules/actions.md) module to determine the action to be taken based on the received query.
  * `additionalAppConfigFiles` An ordered array of any additional App config file names to load from the App config directory.

**Returns:** Boolean indicating whether all the modules have been loaded ok or not.

## callMethodOnAllModules\( methodName \)

Calls the specified static method on all the available Cherrycake and App modules where it's implemented, and then loads those modules.

**Parameters**

* `methodName` The method name to call





\*\*\*\*



