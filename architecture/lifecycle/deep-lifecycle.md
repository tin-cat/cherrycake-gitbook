---
description: Let's take a deep dive on a typical request lifecycle.
---

# Deep lifecycle

To deeper understand the lifecycle of a request, we'll use the same example as in the [Lifecycle](./) section, but this time we'll stop and see with greater detail everything that happens behind the scenes, this will give you a better understanding of the Cherrycake architecture.

{% hint style="info" %}
If you'd rather prefer to start working with Cherrycake and skip this section about the inner workings of Cherrycake, go straight to the [Getting started](../../guide/getting-started/) guide, or keep on learning about the Cherrycake architecture in the [Performance](../performance.md) section.
{% endhint %}

When a request is received, the `index.php` file in your App's public directory is executed. This is the entry point for all requests to your Cherrycake application, and all it does is loading Cherrycake, initialize it and call the [Engine::attendWebRequest](../../reference/core-classes/engine/methods.md#attendwebrequest) method. This looks something like this:

```php
namespace CherrycakeApp;
require "vendor/tin-cat/cherrycake-engine/load.php"

$e = new \Cherrycake\Engine;

if ($e->init(__NAMESPACE__, [
    "baseCoreModules" => ["Actions"]
]))
    $e->attendWebRequest();

$e->end();
```

When the engine is initialized with [Engine::init](../../reference/core-classes/engine/methods.md#init), it loads and initializes the modules specified in `baseCoreModules`. Since the [Actions](../../reference/core-modules/actions-1/actions.md) modules is the one in charge of receiving and handling requests, you should at least specify this module on the list.

> The default value for the `baseCoreModules` key is `["Actions"]`, so if you only need the Actions module like in our example, you can skip this key on the hash array and it will be included automatically. In the example, this means we can simplify the [Engine::init](../../reference/core-classes/engine/methods.md#init) line to just `$e->init(__NAMESPACE__)`

During its initialization, the [Actions](../../reference/core-modules/actions-1/actions.md) module loops through all available modules and asks them to map whatever actions they might need. It does so by using the [Engine::callMethodOnAllModules](../../reference/core-classes/engine/methods.md#callmethodonallmodules) method, which goes through all the available modules and executes the specified static method name, like this:

```php
$e->callMethodOnAllModules("mapActions");
```

> To optimize performance, the method [Engine::callMethodOnAllModules](../../reference/core-classes/engine/methods.md#callmethodonallmodules) caches the information about which methods are available in modules so it doesn't need to search for those methods each time a request is made.

All `mapActions` methods found in any of the available modules \(both core and app modules\) are executed, so any module that needs to map an action to respond to requests must do it so on its `mapActions` static method by calling the[ Actions::mapAction](../../reference/core-modules/actions-1/actions.md#mapaction) method. In our _Home_ example module, this would look like this:

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

Now that we have all the possible actions mapped, the call to[ Engine::attendWebRequest](../../reference/core-classes/engine/methods.md#attendwebrequest) in `index.php` asks the [Actions](../../reference/core-modules/actions-1/actions.md) module to find and run the action that matches the current request URI. This is how this request to the [Actions](../../reference/core-modules/actions-1/actions.md) module looks internally:

```php
$this->Actions->run($_SERVER["REQUEST_URI"]);
```

Since the browser in our example has requested the root page of our website, the [Actions](../../reference/core-modules/actions-1/actions.md) module searches all the mapped actions for one that matches the current "/" request, and finds the action named "homePage".

> Notice that this action matches our example request of the home page \(`/` path\) because it specifically has no `pathComponents`

In the declaration of this [Action](../../reference/core-classes/action/) the `moduleName` and `methodName` keys are used to specify which module::method should be called when the action is executed. In our example, _Home::homePage._

> Cherrycake provides a request-level cache. At this point, if the requested [Action](../../reference/core-classes/action/) has been cached, the result is obtained from cache and the execution ends here.

The _Home_ module will use the [Patterns](../../reference/core-modules/patterns/) module to retrieve an HTML file and send it back to the browser, this is why this dependency is specified on the `dependentCoreModules` property of _Home_, like this:

```php
var $dependentCoreModules = [
    "Patterns"
];
```

Now _Home::homePage_ uses the method [Patterns::out](../../reference/core-modules/patterns/methods.md#out) to send the HTML file to the browser, like this:

```php
function homePage() {
    global $e;
    $e->Patterns->out("Home/Home.html");
    return true;
}
```

In turn, [Patterns](../../reference/core-modules/patterns/) depends on the [Output](../../reference/core-modules/output/) module, which was loaded and initialized automatically as soon as the chain of dependencies started, when our _Home_ module was loaded.

Since [Patterns](../../reference/core-modules/patterns/) is actually a parser, it not only loads the HTML file, but also parses it using [Patterns:parse](../../reference/core-modules/patterns/#parse-patternname-setup) and then sends the result as a [ResponseTextHtml](../../reference/core-classes/response.md) object to [Output::setResponse](../../reference/core-modules/output/#setresponse-response), like this:

```php
$e->Output->setResponse(new \Cherrycake\ResponseTextHtml([
			"code" => $code,
			"payload" => $this->parse($patternName, $setup)
]));
```

When the execution is about to end, the [Engine](../../reference/core-classes/engine/) calls the `end` method on all loaded modules. The [Output](../../reference/core-modules/output/)  calls [Output::sendResponse](../../reference/core-modules/output/#sendresponse-response) on its `end` method, causing the parsed HTML file to be sent to the browser and concluding the request lifecycle.

