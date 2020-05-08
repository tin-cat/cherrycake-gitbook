# Modules injecting CSS and JavaScript

You know how to [add CSS or JavaScript files](./) to your sets so they get loaded in your web app, there's a better way to do it so it follows the [Cherrycake modules logic](../modules-guide.md) for encapsulation and dependency.

Since modules often represent isolated features of your web app, it makes sense to pair them with the piece of CSS and JavaScript code they need to run.

A simple way of doing it is by calling the [Css::addFileToSet](../../reference/core-modules/css/css-methods.md#addfiletoset) or [Javascript::addFileToSet](../../reference/core-modules/javascript/javascript-methods.md#addfiletoset) methods in the [init](../../reference/core-classes/module/methods.md#init) method of your module, like this:

```php
<?php

namespace CherrycakeApp;

class Home extends \Cherrycake\Module {
    function init() {
        if (!parent::init())
            return false;
        global $e;
        $e->Css->addFileToSet("main", "home.css");
        return true;
    }
}
```

> Don't forget to call [parent::init](../../reference/core-classes/module/methods.md#init) before your module's own initialization tasks.

By doing this, you'll also get the benefits of dependencies: Whenever a module depends on another module, that module's CSS and JavaScript will also be loaded.

Specially when certain areas of your web app depend on specific CSS or JavaScript code that is not used in any other part of the app, it makes sense to make those modules load their own files instead of adding them manually in the `Css.config.php` or `Javascript.config.php` files, so that code will only be loaded by the client's browser when he's visiting the areas that need them.

 

