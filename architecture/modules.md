---
description: >-
  Modules pack process-specific functionality in isolated classes with
  auto-loading, dependency and configuration capabilities, so it's easier to
  keep your app structure clean and clear.
---

# Modules

In Cherrycake, all process-specific functionality is packed in modules. A great example is the [Database](../reference/core-modules/database.md) module, which is in charge of all the communication with a server like MySQL.

### Dependency

Most modules depend on others to do their job. When this happens, dependencies are solved automatically and all the needed modules are loaded on the fly. For example, the [Database](../reference/core-modules/database.md) module might need at some point the [Security](security.md) module to ensure the data you're storing in the database is safe.

### Module configuration

Modules can have configuration files. For example, the [Database](../reference/core-modules/database.md) module requires a configuration file where you set up a MySQL server address, user and password. User modules can have configuration files too.

### Actionability

Modules can respond to requests, so they're the entry point in the [Lifecycle](lifecycle/) of a request to any Cherrycake application. The [Actions](../reference/core-modules/actions-1/actions.md) module takes care of routing requests to the matching mapped modules.

