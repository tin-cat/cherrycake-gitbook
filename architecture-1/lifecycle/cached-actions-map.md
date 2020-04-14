---
description: Let's take a deep dive on a typical request lifecycle.
---

# Deep lifecycle

To deeper understand the lifecycle of a request, we'll use the same example as in the [Lifecycle](./) section, but this time we'll stop and see with greater detail everything that happens behind the scenes, this will give you a deeper understanding of the Cherrycake architecture.

When a request is received, the `index.php` file in your App's public directory is executed. This is the entry point for all requests to your Cherrycake application, and all it does is loading Cherrycake, initialize it and launch [Engine::attendWebRequest](../../reference/core-classes/engine/attendwebrequest.md). This looks something like this:

```php
namespace CherrycakeApp;
require "vendor/tin-cat/cherrycake-engine/load.php"

$e = new \Cherrycake\Engine;

if ($e->init([
    "namespace" => __NAMESPACE__,
    "baseCherrycakeModules" => [
        "Output",
        "Errors",
        "Actions",
        "Cache"
    ]
]))
    $e->attendWebRequest();

$e->end();
```

When the engine is initialized with [Engine::init](../../reference/core-classes/engine/init.md), it loads and initializes the modules specified in `baseCherrycakeModules`. Since the [Actions](../../reference/core-modules/actions.md) modules is the one in charge of receiving and handling requests, you should at least specify this module on the list.

During its initialization, the [Actions](../../reference/core-modules/actions.md) module loops through all available modules and asks them to map whatever actions they might need. It does so by using the [Engine::callMethodOnAllModules](../../reference/core-classes/engine/callmethodonallmodules.md) method, which goes through all the available modules and executes the specified static method name, like this:

```php
$e->callMethodOnAllModules("mapActions");
```

All `mapActions` methods found in any of the available modules \(both core and app modules\) are executed, so any module that needs to map an action to respond to requests must do it so on its `mapActions` static method.

[Engine::attendWebRequest ](../../reference/core-classes/engine/attendwebrequest.md)asks the [Actions](../../reference/core-modules/actions.md) module to run the action matching the current request URI. This is how this request to the [Actions](../../reference/core-modules/actions.md) module looks:

```php
$this->Actions->run($_SERVER["REQUEST_URI"]);
```



