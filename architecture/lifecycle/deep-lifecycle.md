---
description: Let's take a deep dive on a typical request lifecycle.
---

# Deep lifecycle

To deeper understand the lifecycle of a request, we'll use the same example as in the [Lifecycle](./) section, but this time we'll stop and see with greater detail everything that happens behind the scenes, this will give you a better understanding of the Cherrycake architecture.

When a request is received, the `index.php` file in your App's public directory is executed. This is the entry point for all requests to your Cherrycake application, and all it does is loading Cherrycake, initialize it and launch [Engine::attendWebRequest](../../reference/core-classes/engine.md#attendwebrequest). This looks something like this:

```php
namespace CherrycakeApp;
require "vendor/tin-cat/cherrycake-engine/load.php"

$e = new \Cherrycake\Engine;

if ($e->init(__NAMESPACE__, [
    "baseCoreModules" => [
        "Actions"
    ]
]))
    $e->attendWebRequest();

$e->end();
```

When the engine is initialized with [Engine::init](../../reference/core-classes/engine.md#init-appnamespace-setup), it loads and initializes the modules specified in `baseCoreModules`. Since the [Actions](../../reference/core-modules/actions.md) modules is the one in charge of receiving and handling requests, you should at least specify this module on the list.

> If you only need the Actions module as your `baseCoreModules`, you can skip this key on the hash array and it will be included automatically. In our example, this means we can simplify the [Engine::init ](../../reference/core-classes/engine.md#init-appnamespace-setup)line to just `$e->init(__NAMESPACE__)`

During its initialization, the [Actions](../../reference/core-modules/actions.md) module loops through all available modules and asks them to map whatever actions they might need. It does so by using the [Engine::callMethodOnAllModules ](../../reference/core-classes/engine.md#callmethodonallmodules-methodname)method, which goes through all the available modules and executes the specified static method name, like this:

```php
$e->callMethodOnAllModules("mapActions");
```

> To optimize performance, the method [Engine::callMethodOnAllModules](../../reference/core-classes/engine.md#callmethodonallmodules-methodname) caches the information about which methods are available in modules so it doesn't need to search for those methods each time a request is made.

All `mapActions` methods found in any of the available modules \(both core and app modules\) are executed, so any module that needs to map an action to respond to requests must do it so on its `mapActions` static method by calling the Actions::mapAction method. In our _Home_ example module, this would look like this:

```php
public static function mapActions() {
	global $e;
	$e->Actions->mapAction(
		"homePage",
		new \Cherrycake\Action([
			"moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
			"moduleName" => "Home",
			"methodName" => "homePage",
			"request" => new \Cherrycake\Request([
				"pathComponents" => false,
				"parameters" => false
			])
		])
	);
}
```

Now that we have all the possible actions mapped, the call to [Engine::attendWebRequest]() in `index.php` asks the [Actions]() module to find and run the action that matches the current request URI. This is how this request to the [Actions]() module looks:

```php
$this->Actions->run($_SERVER["REQUEST_URI"]);
```

Since the browser in our example has requested the root page of our website, the [Actions]() module searches all the mapped actions for one that matches the current "/" request, and finds the action named "homePage".

> Notice that this action matches our example request of the home page \(`/` path\) because it specifically has no `pathComponents`

In the declaration of this [Action](../../reference/core-classes/action.md) the `moduleName` and `methodName` keys are used to specify which module::method should be called when the action is executed. In our example, _Home::homePage._

> Cherrycake provides a request-level cache. At this point, if the requested [Action](../../reference/core-classes/action.md) has been cached, the result is obtained from cache and the execution ends here.

The _Home_ module will use the [Patterns](../../reference/core-modules/patterns.md) module to retrieve an HTML file and send it back to the browser, this is why this dependency is specified on the `dependentCoreModules` property of _Home_, like this:

```php
var $dependentCoreModules = [
    "Patterns"
];
```

Now _Home::homePage_ uses the method [Patterns::out](../../reference/core-modules/patterns.md#out-patternname-setup-code) to send the HTML file to the browser, like this:

```php
function homePage() {
    global $e;
    $e->Patterns->out("Home/Home.html");
    return true;
}
```

In turn, [Patterns](../../reference/core-modules/patterns.md) depends on the [Output](../../reference/core-modules/output.md) module, which was loaded and initialized automatically as soon as the chain of dependencies started, when our _Home_ module was loaded.

Since [Patterns](../../reference/core-modules/patterns.md) is actually a parser, it not only loads the HTML file, but also parses it using [Patterns:parse](../../reference/core-modules/patterns.md#parse-patternname-setup) and then sends the result as a [ResponseTextHtml]() object to [Output::setResponse](../../reference/core-modules/output.md#setresponse-response), like this:

```php
$e->Output->setResponse(new \Cherrycake\ResponseTextHtml([
			"code" => $code,
			"payload" => $this->parse($patternName, $setup)
]));
```

When the execution is about to end, the [Engine]() calls the `end` method on all loaded modules. The [Output](../../reference/core-modules/output.md)  calls [Output::sendResponse](../../reference/core-modules/output.md#sendresponse-response) on its `end` method, causing the parsed HTML file to be sent to the browser and concluding the request lifecycle.

