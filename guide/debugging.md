# Debugging

[Engine::getStatus](../reference/core-classes/engine.md#getstatus) and [Engine:getStatusHumanReadable](../reference/core-classes/engine.md#getstatushumanreadable) will give you a hash array with detailed information on Cherrycake, the loaded modules, the mapped actions and some benchmarks.

{% hint style="info" %}
Note that the status information will be incomplete if the `isDevel` engine option is not set to true.
{% endhint %}

For a convenient way of getting the status of the engine, just use the [Engine:getStatusHtml](../reference/core-classes/engine.md#getstatushtml) method at the desired point in your code, like this:

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

A more usual way of using [Engine:getStatusHtml](../reference/core-classes/engine.md#getstatushtml) is to call it after all execution has been done, and  just before the engine is about to end. Here's a way to do it in your `/public/index.php` file:

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
