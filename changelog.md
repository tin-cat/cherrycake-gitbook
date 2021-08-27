# Changelog

Cherrycake adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html), meaning version numbers match the **`<Major>`**`.`**`<Minor>`**`.`**`<Patch>`** syntax:

* **Major** version numbers change when there are changes that are incompatible with earlier major versions. For example: A Cherrycake application using major version `0` will need to be heavily modified in order to work with version `1`.
* **Minor** version numbers change when there are new functionalities or improvements that are compatible with earlier minor versions. For example: A Cherrycake application using version `0.3.x` will work without much changes or no changes at all when upgraded to Cherrycake version `0.4.x`.
* **Path** version numbers change when there are updates that solve bugs in a completely backwards compatibility fashion. For example: A Cherrycake application using version `0.3.4` will work without any changes at all when upgraded to `0.3.5`.



## Version 1.0.0b

A major upgrade released on 2021-05-29, mainly based around leveraging class discovery to [composer](https://getcomposer.org), and better organizing the code into namespaces and subnamespaces. UI Components are entirely removed after being considered as an obsolete UI architecture, and re-formulating Cherrycake's scope to not impose any UI-specific architecture. See the [Migration](migration.md#migrating-from-0-x-to-1-x) section for a guide on how to migrate your existing Cherrycake version 0.x application to version 1.x.

### Changed

* Composer-based autoloading system, a standard class and module autloading mechanism that simplifies overall structure for Cherrycake apps.
* Core modules are now stored in /src//.php
* Core classes are now stored in /src/.php
* App module are now stored in /src//.php by default
* App classes are now stored in /src/.php by default
* Modules are now set in their own subnamespace inside the `Cherrycake` namespace. For example, the `Actions` module now resides in the `\Cherrycake\Actions` namespace and the `Output` module now resides in the `\Cherrycake\Output` namespace.
* Because modules now reside in their own subnamespace, classes related to specific modules also reside now in the matching subnamespace. For example, the `Action`, `ActionHtml`, `Request`, `RequestPathComponent` and alike all now reside in the `\Cherrycake\Actions` namespace.
* Class and module files must now have `.php` extension instead of `.class.php`
* Module configuration files are now autodetected, so `isConfigFile` property for modules is no longer needed.
* Janitor tasks configuration files are now autodetected, so `isConfigFile` property is no longer needed.
* Global constants are declared in `/constants.php`.
* Autoloading of classes is now handled via composer, so you need to add this to your `composer.json` file:

  ```javascript
  "autoload": {
    "psr-4": {
        "CherrycakeApp\\": "src/"
    }
  }
  ```

### Removed

UIComponents are no longer part of Cherrycake because they were based on an obsolete web design standard, in favor of modern web UI techniques.

