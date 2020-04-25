---
description: >-
  Manage the queries to the engine. It answers to queries by evaluating the
  query path and parameters and finding a matching mapped Action.
---

# Actions

{% tabs %}
{% tab title="Configuration" %}
* **`defaultActionCacheTtl`** The default cache provider name to use. Default: `engine`
* **`defaultActionCacheTtl`** The default TTL. Default: `CACHE_TTL_NORMAL`
* **`defaultActionCachePrefix`** The default cache prefix. Default: `Actions`
* **`sleepSecondsWhenActionSensibleToBruteForceAttacksFails`** An array containing the minimum and maximum number of seconds to wait when an action marked as sensible to brute force attacks has been executed and failed. Default: `[0, 3]`
{% endtab %}

{% tab title="Methods" %}
## getAction\( actionName \) <a id="getaction"></a>

Returns the action with the given actionName.

* **`actionName`** String

**Returns:** [Action](../core-classes/action.md) object or false if the action has not been mapped.

## init

Initializes the module, loads the dependent module classes and calls the `mapActions` method on all available modules using [Engine::callMethodOnAllModules](../core-classes/engine.md#callmethodonallmodules-methodname).

## isAction\( actionName \) <a id="isaction"></a>

Checks if the action with the given actionName has been mapped.

* **`actionName`** String

**Returns:** Boolean

## mapAction\( actionName, action \) <a id="mapaction"></a>

Maps an action for a module.

* **`actionName`** String
* **`action`** [Action](../core-classes/action.md) object

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
{% endtab %}
{% endtabs %}

