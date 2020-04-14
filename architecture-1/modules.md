---
description: >-
  Modules pack operational functionality in isolated classes while providing you
  with auto-loading, dependency and configuration capabilities, so it's easier
  to keep your app structure clean and clear
---

# Modules

In Cherrycake, all operational functionality is isolated in modules. A great example is the [Database](../reference/core-modules/database.md) module, which is in charge of all the communication with a server like MySQL. Modules come in two flavors:

* [Core modules](../reference/core-modules/)
  * Ready-made modules provided by Cherrycake, they implement all the operational functionality behind the Cherrycake architecture.
* [User modules](../reference/user-modules.md)
  * Modules created by the developer when creating a new application, they implement the operational functionality behind a specific application.

### Auto-loading

Modules are loaded automatically only when they're needed, on the fly, and in a per-request basis. This guarantees that only the needed code is loaded in every request. That works both for core and user modules.

### Dependency

Most modules depend on others to do their job. For example, the [Database](../reference/core-modules/database.md) module might need at some point the [Security](security.md) module to ensure the data you're storing in the database is safe. Dependencies are solved automatically, and only where they're needed.

### Module configuration

Modules can have configuration files. For example, the [Database](../reference/core-modules/database.md) module requires a configuration file where you set up a MySQL server address, user and password. User modules can have configuration files, too.

