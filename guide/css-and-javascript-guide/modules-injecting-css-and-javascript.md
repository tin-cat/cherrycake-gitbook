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

## Loading Css and JavaScript only where it's needed

Specially when certain areas of your web app depend on specific CSS or JavaScript code that is not used in any other part of the app, it makes sense to make those modules load their own files instead of adding them manually to the `Css.config.php` or `Javascript.config.php` files.

By doing so,  that code will only be loaded when the modules that need those Css and JavaScript files are loaded. That is: when the user is visiting the areas in your web app that need them.

## Optimizing number of requests vs. CSS and JavaScript re-usability

A problem shows up when you start optimizing your site so certain Css or JavaScript only gets loaded in certain pages. Because Cherrycake joins all your CSS and JavaScript code in a single request to optimize loading times, you might find the browser loading different versions of the Css and JavaScript files on each page of your app, defeating the purpose of using a cache and actually loading pieces of code that were already loaded in other requests with different CSS or JavaScript set configurations.

The question is: Shall I make the browser load all the CSS and JavaScript on the first page so the upcoming pages take advantage of the cache, or it's better to distribute my CSS and JavaScript in separate requests to different sets, so only the code needed for each page is loaded?

This are the options Cherrycake gives you to solve this problem the way you decide to:

* Setup the CSS and JavaScript files you want to load in your web app by listing them in the `Css.config.php` or `Javascript.config.php` files, or just set the `isIncludeAllFilesInDirectory` to `true` there, [as seen here](./). All files in the specified directories will be loaded in the first request to your web app, and subsequent requests will take advantage of the browser's caching mechanism.
* Let your modules add the CSS and JavaScript they need by overloading the init method as you've seen [above](modules-injecting-css-and-javascript.md#loading-css-and-javascript-only-where-its-needed). Certain Css and JavaScript will only be loaded when the browser requests the pages that need them, but you might lose caching and re-usability benefits if not done carefully.

> You can control which sets get joined in a single request, and divide them in different requests to further customize your CSS and JavaScript loading strategy by using the [HtmlDocument `cssSets` and `javascriptSets` configuration keys](../../reference/core-modules/htmldocument/#configuration).

 

