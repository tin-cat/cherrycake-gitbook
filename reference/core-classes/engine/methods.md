# Engine methods

## attendWebRequest

Attends the request received from a web server by calling Actions::run with the requested URI string

## callMethodOnAllModules\( methodName \) <a id="callmethodonallmodules"></a>

Calls the specified static method on all the available Core and App modules where it's implemented, and then loads those modules.

* **`methodName`** The method name to call

## end

Ends the application by calling the `end` methods of all the loaded modules.

## getStatus

Returns information about the engine and its current status, including the loaded modules, the mapped actions and some benchmarks.

> Note that some information on the return array will be missing if the `isDevel` option has not been activated when initializing the engine. This also applies to the [getStatusHumanReadable](./#getstatushumanreadable) and [getStatusHtml](./#getstatushtml) methods.

**Returns:** A hash array with the information

## getStatusHumanReadable

Returns a human-readable version of the status information provided by the [getStatus](./#getstatus) method.

**Returns:** A hash array with the status information in a human readable format

## getStatusHtml

Returns an HTML version of the status in a human readable format.

**Returns:** The HTML code

## init\( appNamespace, setup \) <a id="init"></a>

Initializes the Cherrycake engine.

* **`appNamespace`** The app namespace
* **`setup`** Optional hash array
  * **`appName`** The app name
  * **`isDevel`** Set it to true if the app is running in a development environment
  * **`isUnderMaintenance`** Whether the App is under maintenance or not
  * **`isCli`** Whether the engine is running as a cli or not. When not specified, it will autodetect.
  * **`configDir`** The directory where configuration files are stored
  * **`appModulesDir`** The directory where app modules are stored
  * **`appClassesDir`** The directory where app classes are stored
  * **`timezoneName`** The system's timezone. All modules, including Database for date/time retrievals/saves will be made taking this timezone into account. The server is expected to run on this timezone. Default: `Etc/UTC`
  * **`timezoneId`** The system's timezone. The same as `timezoneName`, but the matching id on the Cherrycake timezones database table. Default: `532` \(532 is the id for the Etc/UTC time zone\)
  * **`baseCoreModules`** An ordered array of the base Core module names that has to be always loaded on application start. Defaults to \["Actions"\]. This list should include the [Actions](../../core-modules/actions-1/actions.md) module to provide some kind of functionality to the app, since otherwise it wouldn't be answering any requests and will be completely unusable, except if you're experimenting with different ways of using the Cherrycake engine. See [Working with Actions](../../../guide/actions-guide/).
  * **`baseAppModules`** An ordered array of the base App module names that has to be always loaded on application start.
  * **`additionalAppConfigFiles`** An ordered array of any additional App config file names to load from the App config directory.

**Returns:** Boolean indicating whether all the modules have been loaded ok or not.

## loadAppModule\( moduleName, requiredByModuleName \) <a id="loadappmodule"></a>

* **`moduleName`** The name of the module.
* **`requiredByModuleName`** Optional name of the module that required to load the module.

## loadCoreModule\( moduleName, requiredByModuleName \) <a id="loadcoremodule"></a>

Loads a Core [module](../../../guide/modules-guide.md).

* **`moduleName`** The name of the module.
* **`requiredByModuleName`** Optional name of the module that required to load the module.

Loads an [App module](../../../architecture/modules.md).

