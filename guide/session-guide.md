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

Now, to use the Session module, you just need to add it to the list of your core module dependencies, like this:

```php
<?php

namespace CherrycakeApp\Modules;

class HelloWorld extends \Cherrycake\Module {
    protected $dependentCoreModules = [
        "Session"
    ];

    ...    
}
```

