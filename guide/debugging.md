# Debugging

[Engine::getStatus](../reference/core-classes/engine/#getstatus) and [Engine:getStatusHumanReadable](../reference/core-classes/engine/#getstatushumanreadable) will give you a hash array with detailed information on Cherrycake, the loaded modules, the mapped actions and some benchmarks.

> Note that the status information will be incomplete if the [`isDevel`](../reference/core-classes/engine/#init-appnamespace-setup) engine option is not set to true.

For a convenient way of getting the status of the engine, just use the [Engine:getStatusHtml](../reference/core-classes/engine/#getstatushtml) method at the desired point in your code, like this:

```php
echo $e->getStatusHtml();
```

This will give show you a status report like this:

```javascript
{
    "appNamespace": "CherrycakeApp",
    "appName": "CherrycakeApp",
    "isDevel": true,
    "isUnderMaintenance": false,
    "documentRoot": "/var/www/app/public",
    "appModulesDir": "/var/www/app/modules",
    "appClassesDir": "/var/www/app/classes",
    "timezoneName": "Etc/UTC",
    "timezoneId": "532",
    "executionStartHrTime": 40610742477736,
    "runningHrTime": "2.5756ms",
    "memoryUse": 537832,
    "memoryUsePeak": 570840,
    "memoryAllocated": 2097152,
    "memoryAllocatedPeak": 2097152,
    "hostname": "22134d6f3030",
    "host": "localhost",
    "ip": "192.168.32.1",
    "os": "Linux",
    "phpVersion": "7.4.2",
    "serverSoftware": "nginx/1.17.8",
    "serverGatewayInterface": "CGI/1.1",
    "serverApi": "fpm-fcgi",
    "loadedModules": [
        "Actions",
        "Output",
        "Errors",
        "Security",
        "Cache",
        "HelloWorld"
    ],
    "moduleLoadingHistory": [
        "Cherrycake/Actions / Base module / loaded at 0.1108ms / init took 2.2079ms",
        "Cherrycake/Output / Required by Actions / loaded at 0.1976ms / init took 0.0444ms",
        "Cherrycake/Errors / Required by Actions / loaded at 0.3398ms / init took 0.0468ms",
        "Cherrycake/Security / Required by Actions / loaded at 0.4855ms / init took 0.2553ms",
        "Cherrycake/Cache / Required by Security / loaded at 0.6055ms / init took 0.0985ms",
        "CherrycakeApp/HelloWorld / Base module / loaded at 2.4278ms / init took 0.0049ms"
    ],
    "actions": {
        "mappedActions": {
            "css": "Css::dump css (set=none version=none)",
            "janitorRun": "Janitor::run janitor/run (key=none task=none isForceRun=none)",
            "janitorStatus": "Janitor::status janitor/status (key=none)",
            "TableAdminGetRows": "TableAdmin::getRows TableAdmin/[String]/getRows (additionalFillFromParameters=none)",
            "javascript": "Javascript::dump js (set=none version=none)",
            "home": "HelloWorld::show /"
        }
    }
}
```

A more usual way of using [Engine:getStatusHtml](../reference/core-classes/engine/#getstatushtml) is to call it after all execution has been done, and just before the engine is about to end. Here's a way to do it in your `/public/index.php` file:

```php
<?php

namespace CherrycakeApp;

require "/engine/load.php";

$e = new \Cherrycake\Engine;

if ($e->init(__NAMESPACE__, [
    "isDevel" => true
]))
    $e->attendWebRequest();

echo $e->getStatusHtml(); die;

$e->end();
```

Here's some interesting information you'll find in the output of [Engine:getStatusHtml](../reference/core-classes/engine/#getstatushtml):

* `runningHrTime` The amount of time it took PHP to run the current request, up to the point where you called the getStatus method.
* `moduleLoadingHistory` The list modules that were loaded when you called the getStatus method, in the order they were loaded, and including this extra information:
  * Whether the module was loaded as a base module, as a dependency of another module or programmatically.
  * The point in time after the execution started where the module was loaded.
  * The amount of time it took the module to load and init, including loading any other module dependencies.
* `mappedActions` The list of mapped actions when you called the getStatus method, including the module::class they call, their route and the parameters they accept.

