---
description: The Session module provides a session tracking and session storage mechanism.
---

# Session guide

When using the [Session](../reference/core-modules/session.md) module, each visitor to your web app is assigned a random and secure unique identifier, and you'll be able to keep track of their activity across requests, and store visitor-specific data.

The most obvious use of a session mechanism like this is to implement a login system to let your users identify themselves with some sort of password, and give them access to their private sections and functionalities. This is exactly what the [Login module](login-guide.md) does using [Session](../reference/core-modules/session.md).

But you can use the [Session](../reference/core-modules/session.md) module for many other purposes. Let's see how. First, let's remember our simple [Hello world web app](getting-started/#the-hello-world-module), which worked with this basic `HelloWorld` app module:

```php
<?php

namespace CherrycakeApp\Modules;

class HelloWorld extends \Cherrycake\Module {

    public static function mapActions() {
        global $e;
        $e->Actions->mapAction(
            "home",
            new \Cherrycake\ActionHtml([
                "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
                "moduleName" => "HelloWorld",
                "methodName" => "show",
                "request" => new \Cherrycake\Request([
                    "pathComponents" => false,
                    "parameters" => false
                ])
            ])
        );
    }
    
    function show() {
        global $e;
        $e->Output->setResponse(new \Cherrycake\ResponseTextHtml([
            "code" => \Cherrycake\Modules\RESPONSE_OK,
            "payload" => "<html><body>Hello world</body></html>"
        ]));
    }
    
}
```

Now, to use the [Session](../reference/core-modules/session.md) module, you first need to add it to the list of your core [module dependencies](modules-guide.md#specifying-module-dependencies), like this:

```php
class HelloWorld extends \Cherrycake\Module {
    protected $dependentCoreModules = [
        "Session"
    ];

    ...    
}
```

But that's not all. The [Session](../reference/core-modules/session.md) module depends on the [Database](../reference/core-modules/database.md) module himself, and needs a database table with a certain structure. To do so, you need to setup your database connection by creating a `/config/Database.config.php` file just like we did in the [Database guide](database-guide/).

Also, you need to import the `session.sql` file to create the table needed by the [Session](../reference/core-modules/session.md) module. You'll find this file in the [Cherrycake database skeleton](getting-started/#setting-up-the-skeleton-database).

