---
description: >-
  Actions is the routing core module of Cherrycake, and allows your application
  to receive requests and attend them accordingly.
---

# Actions guide

When using [Actions](../../reference/core-modules/actions-1/actions.md), all the modules who will be receiving requests should map their actions in the [Module::mapActions](../../reference/core-classes/module/methods.md#mapactions) method, by calling [Actions::mapAction](../../reference/core-modules/actions-1/actions.md#mapaction).

> [Actions](../../reference/core-modules/actions-1/actions.md) is the default base core module because it is what you'll need in most cases. If you're experimenting with different ways of using Cherrycake, you can specify a different set of base modules in [Engine::init](../../reference/core-classes/engine/methods.md#init)

When a request is received, [Actions](../../reference/core-modules/actions-1/actions.md) will look through all the mapped actions. If any of them matches the current request, it will load the associated module and run the mapped method.

> [Actions](../../reference/core-modules/actions-1/actions.md) calls [mapActions](../../reference/core-classes/module/#mapactions) methods on all available modules during its initialization, using the [Engine::callMethodOnAllModules](../../reference/core-classes/engine/methods.md#callmethodonallmodules)

For example, the following module maps a simple action named `home` that will call the `viewHome` method when the root page `/` is requested:

```php
<?php

namespace CherrycakeApp\Modules;

class Home extends \Cherrycake\Module {

    public static function mapActions() {
        global $e;
        
        $e->Actions->mapAction([
            "home",
            new \Cherrycake\ActionHtml([
                "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
                "moduleName" => "Home",
                "methodName" => "viewHome",
                "request" => new \Cherrycake\Request([
                    "pathComponents" => false
                ])
            ])
        ]);
        
    }
    
    function viewHome() {
        // Show the home page
    }

}
```

{% hint style="info" %}
You'll find the examples used on this guide in the [Cherrycake documentation examples](https://github.com/tin-cat/cherrycake-documentation-examples) repository, under the `ActionsGuide` module.
{% endhint %}

