---
description: Modular architecture is at the heart of Cherrycake
---

# Modules

Modules pack the process-specific logic of an app and have some [additional benefits](../../architecture/modules.md) and [important differences](../../architecture/classes.md#whats-the-difference-between-a-class-and-a-module) over regular classes. Modules come in two flavors:

* [Core modules](../../reference/core-modules/)
  * Ready-made modules provided by Cherrycake, they implement all the process-specific functionality behind the Cherrycake architecture. Examples of core modules are [Actions](../../reference/core-modules/actions.md), [Database](../../reference/core-modules/database.md) and [Patterns](../../reference/core-modules/patterns.md).
*  App modules
  * Modules created by the developer when creating a new application. An example of an App module would be the `HelloWorld` module we created in the[ Getting started](../getting-started/#the-hello-world-module) section.

## Loading modules

Modules must be loaded before they can be used, they can be loaded in three ways:

* As a **Base core module**, when initializing the engine. Base core modules are loaded right when the engine is initialized. You specify your base modules in the `baseCoreModules` setup key of [Engine::init](../../reference/core-classes/engine.md#init-appnamespace-setup). See the [Deep lifecycle](../../architecture/lifecycle/deep-lifecycle.md) section for more details on this.
* As a **dependent module**, when they're required by other modules in their [Module::dependentCoreModules](../../reference/core-classes/module.md#usddependentcherrycakemodules) or [Module::dependentAppModules](../../reference/core-classes/module.md#usddependentappmodules) properties. See the [Create an App module](create-an-app-module.md) for more details on this.
* At any point in your code, **programmatically**. Just by calling [Engine::loadCoreModule](../../reference/core-classes/engine.md#loadcoremodule-modulename-requiredbymodulename) or [Engine::loadAppModule](../../reference/core-classes/engine.md#loadappmodule-modulename-requiredbymodulename).

## Accessing modules

Once they're loaded, modules are always accessible as properties of the engine. For example, the [Patterns](../../reference/core-modules/patterns.md) module will be available in your code by doing this:

```php
global $e;
$e->Patterns->out("Pattern.html");
```

## Modules lifecycle

When a module is loaded for the first time during a request, this is what happens:

1. The module file is loaded, and the module instantiated.
2. The `init` method of the module is called, which does the following:
   1. If the module has some dependencies on other modules, they're loaded.
   2. If the module has a configuration file, it is loaded.
   3. Any other module-specific initialization is done.
3. When the engine request has finished, or if any module initialization failed, the `end` method is called.

