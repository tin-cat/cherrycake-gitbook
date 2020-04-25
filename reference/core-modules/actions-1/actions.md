# Actions methods

## getAction\( actionName \) <a id="getaction"></a>

Returns the action with the given actionName.

* **`actionName`** String

**Returns:** [Action](../../core-classes/action/) object or false if the action has not been mapped.

## init

Initializes the module, loads the dependent module classes and calls the `mapActions` method on all available modules using [Engine::callMethodOnAllModules](../../core-classes/engine/#callmethodonallmodules-methodname).

## isAction\( actionName \) <a id="isaction"></a>

Checks if the action with the given actionName has been mapped.

* **`actionName`** String

**Returns:** Boolean

## mapAction\( actionName, action \) <a id="mapaction"></a>

Maps an action for a module.

* **`actionName`** String
* **`action`** [Action](../../core-classes/action/) object

```php
$e->Actions->mapAction(
    "home",
    new \Cherrycake\Action([
        "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
        "moduleName" => "Home",
				"methodName" => "homePage",
				"request" => new \Cherrycake\Request([
            "pathComponents" => false,
            "parameters" => false
        ])
    ]);
);
```

## run

Parses the received query to find the corresponding action and runs it

