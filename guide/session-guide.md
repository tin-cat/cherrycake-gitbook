---
description: The Session module provides a session tracking and session storage mechanism.
---

# Session guide

When using the [Session](../reference/core-modules/session/) module, each visitor to your web app is assigned a random and secure unique identifier, and you'll be able to keep track of their activity across requests, and store visitor-specific data.

The most obvious use of a session mechanism like this is to implement a login system to let your users identify themselves with some sort of password, and give them access to their private sections and functionalities. This is exactly what the [Login module](login-guide/) does using [Session](../reference/core-modules/session/).

But you can use the [Session](../reference/core-modules/session/) module for many other purposes. Let's see how.

## Setting up the Session database table

The [Session](../reference/core-modules/session/) module uses the `cherrycake_session` table in the database to store the sessions information.

> You can create the Session table in your database by importing the `session.sql` file you'll find in the [Cherrycake skeleton repository](https://github.com/tin-cat/cherrycake-skeleton), under the `install/database` directory.

Because [Session](../reference/core-modules/session/) needs a connection to a database, you need to set it but by creating a `/config/Database.config.php` file just like we did in the [Database guide](database-guide/).

## Working with Session

First, let's remember our simple [Hello world web app](getting-started/#the-hello-world-module), which worked with this basic `HelloWorld` app module:

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
            "code" => \Cherrycake\RESPONSE_OK,
            "payload" =>
                $e->HtmlDocument->header().
                "Hello world!".
                $e->HtmlDocument->footer()
        ]));
    }
    
}
```

> Note we've updated the `show` method to use the [HtmlDocument](../reference/core-modules/htmldocument/) module to create the HTML document structure, now that we learned how it works in the [HtmlDocument Guide](htmldocument-guide.md).

Now, to use the [Session](../reference/core-modules/session/) module, you first need to add it to the list of your core [module dependencies](modules-guide.md#specifying-module-dependencies), like this:

```php
class HelloWorld extends \Cherrycake\Module {
    protected $dependentCoreModules = [
        "Session"
    ];

    ...    
}
```

Now, let's say we want to show how many times the visitor has seen the Hello World page. We'll do this by storing the views counter in the visitor's session, like this:

```php
function show() {
    global $e;
    
    $e->Session->numberOfTimesViewed ++;
    
    $e->Output->setResponse(new \Cherrycake\ResponseTextHtml([
        "code" => \Cherrycake\RESPONSE_OK,
        "payload" =>
            $e->HtmlDocument->header().
            "You've seen this page {$e->Session->numberOfTimesViewed} times".
            $e->HtmlDocument->footer()
    ]));
}
```

Now, every time a visitor reloads the page they'll see the counter growing:

```text
You've seen this page 2 times
```

{% hint style="success" %}
See this example working in the [Cherrycake documentation examples](https://documentation-examples.cherrycake.io/example/sessionGuideExample) site.
{% endhint %}

