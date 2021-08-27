---
description: >-
  Instructions on how to migrate your existing Cherrycake application from
  earlier versions of the Cherrycake engine.
---

# Migration

## Migrating from 1.x to 2.x

* If you were using the [Locale](reference/core-modules/locale/) module to get multi-lingual texts in your App, take a look at the new [Translation](reference/core-modules/translation.md) module.
* Almost all the important methods are now called using named arguments, which allows for an easier and cleaner way of passing parameters to methods. The best way of migrating your app is to take a look at the updated documentation for each module and class you're using to see how parameters are now passed.

## Migrating from 0.x to 1.x

* Update your `composer.json` file to require Cherrycake version 1.x instead of version 0.x:

  ```bash
    composer update
  ```

* Create the `src` directory in your project and move your modules there. Remember modules still have their own subdirectory under `src`. You can remove the now empty `Modules` directory.
* Move all your classes to the `src` directory. Remember classes do not have their own subdirectory, so they reside on the root of `src`. You can remove the now empty `Classes` directory.
* Rename all your modules and class files so they end with `.php` instead of `.class.php`. For example: `MyModule.php` instead of `MyModule.class.php`.
* Assign all your modules to their own namespace by modifying or adding a `namespace` directive at the top of the file. For example, if your module is called `MyModule`, you should add this at the top of `src/MyModule/MyModule.php`:

  ```php
    namespace \CherrycakeApp\MyModule;
  ```

* Remember also to correctly namespace the class your modules extend from. For example, instead of your module being declared like this:

  ```php
    class MyModule extends Module {
  ```

    declare it like this instead:

  ```php
    class MyModule extends \Cherrycake\Module {
  ```

* Assign all your classes the right namespace. If they're classes related to a module, move them to the related module's directory and add the matching namespace. For example, if your class is called `ClassForMyModule` and is related to a module called `MyModule`, move it to `src/MyModule`and add this at the top of `src/MyModule/ClassForMyModule.php`:

  ```php
    namespace \CherrycakeApp\MyModule;
  ```

* You'll need to change how you reference Cherrycake's core modules and classes throughout your code. For example, the following code:

  ```php
    $e->Actions->mapAction(
        "homePage",
        new \Cherrycake\Action([
            "moduleType" => ACTION_MODULE_TYPE_APP,
            "moduleName" => "Home",
            "methodName" => "homePage",
            "request" => new \Cherrycake\Request([
                "pathComponents" => false,
                "parameters" => false
            ])
        ])
    );
  ```

    Should be changed to this:

  ```php
    $e->Actions->mapAction(
        "homePage",
        new \Cherrycake\Actions\Action([
            "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
            "moduleName" => "Home",
            "methodName" => "homePage",
            "request" => new \Cherrycake\Actions\Request([
                "pathComponents" => false,
                "parameters" => false
            ])
        ])
    );
  ```

* Autoloading of classes is now handled via composer, so you need to add this to your `composer.json` file:

  ```javascript
    "autoload": {
        "psr-4": {
            "CherrycakeApp\\": "src/"
        }
    }
  ```

* Update composer's autoload by running the command:

  ```bash
    composer dump-autoload
  ```

* See the documentation at [cherrycake.io](https://cherrycake.io) and the examples at [documentation-examples.cherrycake.io/](https://documentation-examples.cherrycake.io/) to see examples using this new namespacing.

