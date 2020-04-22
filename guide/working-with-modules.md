# Working with modules

Modules pack the process-specific logic of an app and have some [additional benefits](../architecture/modules.md) and [important differences](../architecture/classes.md#whats-the-difference-between-a-class-and-a-module) over regular classes. Modules come in two flavors:

* \*\*\*\*[**Core modules**](../reference/core-modules/)\*\*\*\*
  * Ready-made modules provided by Cherrycake, they implement all the process-specific functionality behind the Cherrycake architecture.
  * Cherrycake comes with a bunch of [Core modules](../reference/core-modules/) aimed to help you build your app. From the main [Actions](../reference/core-modules/actions-1/actions.md) module that routes the requests to your app to modules to work with [Css](../reference/core-modules/css.md) and [JavaScript](../reference/core-modules/javascript.md) files, to control the user [Session](../reference/core-modules/session.md), to access [Database](../reference/core-modules/database.md) and [Cache](../reference/core-modules/cache.md) servers, [automate tasks](../reference/core-modules/janitor.md), [store logs](../reference/core-modules/log.md) and much more.
*  **App modules**
  * Modules created by the developer when creating a new application, which will be in charge of all the processes in your App. You'll have to decide a great App module structure based on the needs of your application.
  * A really simple example of an App module would be the `HelloWorld` module we created in the[ Getting started](getting-started/#the-hello-world-module) section, but a more complex scenario like an e-commerce site might need  modules like `Products`, `Cart`, `Payments`, `ProductCategories`, `Search` and so, for example.

## Loading modules

Modules must be loaded before they can be used, they can be loaded in three ways:

* As a **Base core module**, when initializing the engine. Base core modules are loaded right when the engine is initialized. You specify your base modules in the `baseCoreModules` setup key of [Engine::init](../reference/core-classes/engine/#init-appnamespace-setup). See the [Deep lifecycle](../architecture/lifecycle/deep-lifecycle.md) section for more details on this.
* As a **dependent module**, when they're required by other modules in their [Module::dependentCoreModules](../reference/core-classes/module/#usddependentcherrycakemodules) or [Module::dependentAppModules](../reference/core-classes/module/#usddependentappmodules) properties. See [Specifying module dependencies](working-with-modules.md#specifying-module-dependencies).
* At any point in your code, **programmatically**. Just by calling [Engine::loadCoreModule](../reference/core-classes/engine/#loadcoremodule-modulename-requiredbymodulename) or [Engine::loadAppModule](../reference/core-classes/engine/#loadappmodule-modulename-requiredbymodulename).

## Accessing modules

Once they're loaded, modules are always accessible as properties of the engine. For example, the [Patterns](../reference/core-modules/patterns/) module will be available in your code by doing this:

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

## App module files

The App modules you create must be stored in the `/modules` directory of your app, and also in their own subdirectory, which has to be named exactly like your module. The file name has to be also the exact name of you module, plus the `.class.php` extension.

> You can change the default `/modules` directory for the one of your choice by setting the `appModulesDir` setup key when calling [Engine::init](../reference/core-classes/engine/#init-appnamespace-setup)

For example, if you were to create a module called `Products`, it should be stored on the `/modules/Products/Products.class.php` directory.

> Note that both the subdirectory and the file name itself are case-sensitive.

## Modules configuration file

Modules can have their own configuration file where all settings related to them should be entered. Configuration files are stored under the `/config` directory by default, but you can set your own directory specifying the `configDir` setup key in [Engine::init](../reference/core-classes/engine/#init-appnamespace-setup)

Module configuration files must have a name that matches the module name, even with upper and lowercase characters. For example, the configuration file for the [Database](../reference/core-modules/database.md) module must be called `/config/Database.config.php`

Module configuration files must declare a hash array named in the syntax `$<ModuleName>Config`. For example, this is how a configuration file for the [HtmlDocument](../reference/core-modules/htmldocument.md) module would look:

```php
<?php

namespace Cherrycake;

$HtmlDocumentConfig = [
    "title" => "Web page title",
    "description" => "Web page description"
];
```

You can set default configuration values that will be used if the configuration file didn't exist, or if a specific configuration key was not set on the configuration file. To do so, set the Module::config property of your module, like this:

```php
class MyModule extends \Cherrycake\Module {
    protected $config = [
        "title" => "Default title",
        "description" => "Default description"
    ];
}
```

To get a configuration value from a module, use the [Module::getConfig](../reference/core-classes/module/#getconfig-key) method, for example:

```php
$this->getConfig("title");
```

## Specifying module dependencies

When your module makes use of another modules regularly, you should specify them as a dependency.

Set the [dependentCoreModules](../reference/core-classes/module/#usddependentcoremodules) property of your module to specify which Core modules are required by yours, and the [dependentAppModules](../reference/core-classes/module/#usddependentappmodules) to specify dependencies between your own modules, here's an example:

```php
class MyModule extends \Cherrycake\Module {
    protected $dependentCoreModules = [
        "Database",
        "Patterns"
    ];
    
    protected $dependentAppModules = [
        "MyOtherModule"
    ];
}
```

