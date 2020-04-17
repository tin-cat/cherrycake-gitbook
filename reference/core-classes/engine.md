# Engine

## attendWebRequest

Attends the request received from a web server by calling Actions::run with the requested URI string

## end

Ends the application by calling the `end` methods of all the loaded modules.

## init\( appNamespace, setup \)

Initializes the Cherrycake engine

**Parameters**

* `appNamespace` The app namespace
* `setup` Optional hash array
  * `appName` The app name
  * `isDevel` Set it to true if the app is running in a development environment
  * `isUnderMaintenance` Whether the App is under maintenance or not
  * `configDir` The directory where configuration files are stored
  * `appModulesDir` The directory where app modules are stored
  * `appClassesDir` The directory where app classes are stored
  * `timezoneName` The system's timezone. All modules, including Database for date/time retrievals/saves will be made taking this timezone into account. The server is expected to run on this timezone. Standard "Etc/UTC" is recommended.
  * `timezoneId` The system's timezone. The same as `timezoneName`, but the matching id on the Cherrycake timezones database table
  * `baseCherrycakeModules` An ordered array of the base Cherrycake module names that have to be always loaded on application start. These must include at least the [Actions](../core-modules/actions.md) module to determine the action to be taken based on the received query.
  * `additionalAppConfigFiles` An ordered array of any additional App config file names to load from the App config directory.

**Returns:** Boolean indicating whether all the modules have been loaded ok or not.

## callMethodOnAllModules\( methodName \)

Calls the specified static method on all the available Cherrycake and App modules where it's implemented, and then loads those modules.

**Parameters**

* `methodName` The method name to call





\*\*\*\*



