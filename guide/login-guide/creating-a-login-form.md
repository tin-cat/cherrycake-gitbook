# Creating a login form

The [Login](../../reference/core-modules/login/) module provides the logic for a user authentication mechanism, but it's up to you to build a form to ask the user for his credentials, or to implement any kind of interface for a user to authenticate in your web app.

We'll analyze step by step the example provided in the [Cherrycake documentation examples](https://github.com/tin-cat/cherrycake-documentation-examples) repository, in the module called `LoginGuide`.

First we'll create our module in `/modules/LoguinGuide/LoginGuide.class.php`:

```php
<?php

namespace CherrycakeApp;

class LoginGuide extends \Cherrycake\Module {
    protected $dependentCoreModules = [
        "HtmlDocument",
        "Login"
    ];
}
```

> See how we've already added the [HtmlDocument](../../reference/core-modules/htmldocument/) and [Login](../../reference/core-modules/login/) dependencies.

Now we'll [define an action](../actions-guide/) that will show a welcome page when the user visits the `/login-guide` URL:

```php
<?php

namespace CherrycakeApp;

class LoginGuide extends \Cherrycake\Module {
    protected $dependentCoreModules = [
        "HtmlDocument",
        "Login"
    ];
    
    public static function mapActions() {
        global $e; 
        $e->Actions->mapAction(
            "loginGuideHome",
            new \Cherrycake\ActionHtml([
                "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
                "moduleName" => "LoginGuide",
                "methodName" => "home",
                "request" => new \Cherrycake\Request([
                    "pathComponents" => [
                        new \Cherrycake\RequestPathComponent([
                            "type" => \Cherrycake\REQUEST_PATH_COMPONENT_TYPE_FIXED,
                            "string" => "login-guide"
                        ])
                    ]
                ])
            ])
        );
    }
    
    function home() {
        global $e;
    
        $e->Output->setResponse(new \Cherrycake\ResponseTextHtml([
            "code" => \Cherrycake\RESPONSE_OK,
            "payload" =>
                $e->HtmlDocument->header().
                ($e->Login->isLogged() ?
                    "You are logged in"
                :
                    "You are not logged in"
                ).
                $e->HtmlDocument->footer()
        ]));
    }
}
```

Notice that the page shows the message `You are logged in` or `You are not logged in`. To determine whether the current user is logged in, we use the Login::isLogged method.

