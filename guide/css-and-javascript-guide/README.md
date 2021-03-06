# Css and Javascript guide

The [Css](../../reference/core-modules/css/) and [Javascript](../../reference/core-modules/javascript/) core modules allow you to easily work with CSS and JavaScript files in your web page project with some neat additional features:

* CSS and JavaScript files are parsed as [patterns](../../architecture/patterns/).
* Automatic minimization and single-request serving of multiple files.
* Cached CSS and JavaScript.
* Modules inject the CSS and JavaScript code they themselves.
* CSS and JavaScript dependencies via modules.
* Works in conjunction with [HtmlDocument](../../reference/core-modules/htmldocument/) to automatically link the needed CSS/JavaScript resources in the HTML document.
* Only the required CSS and JavaScript code is loaded.

## Css and Javascript sets

When using the [Css](../../reference/core-modules/css/) or the [Javascript](../../reference/core-modules/javascript/) modules, you first define at least one set that will contain the `*.css` and `*.js` files you'll be using.

Sets are defined in the [Css module configuration file](../../reference/core-modules/css/#configuration) `/config/Css.config.php` and in the [Javascript module configuration file](../../reference/core-modules/javascript/#configuration) `/config/Javascript.config.php`.

Let's take a look at a typical `Css.config.php` configuration file:

```php
<?php

namespace Cherrycake;

$CssConfig = [
    "sets" => [
        "main" => [
            "directory" => APP_DIR."/css"
        ]
    ]
];
```

The `Javascript.config.php` configuration file looks quite similar:

```php
<?php

namespace Cherrycake;

$JavascriptConfig = [
    "sets" => [
        "main" => [
            "directory" => APP_DIR."/javascript"
        ]
    ]
];
```

> Each set can only load files from the directory you've configured.

You can add files to each set directly in the configuration file. Let's say we want to add the CSS file `base.css` to the `main` set, we would modify `Css.config.php` to look like this:

```php
<?php

namespace Cherrycake;

$CssConfig = [
    "sets" => [
        "main" => [
            "directory" => APP_DIR."/css",
            "files" => [
                "base.css"
            ]
        ]
    ]
];
```

You can also just set `isIncludeAllFilesInDirectory` to `true`, and all the `*.css` files in the specified `directory` will be added to the set:

```php
<?php

namespace Cherrycake;

$CssConfig = [
    "sets" => [
        "main" => [
            "directory" => APP_DIR."/css",
            "isIncludeAllFilesInDirectory" => true
        ]
    ]
];
```

> This works exactly the same for the `Javascript.config.php` file.

## CSS and JavaScript minification

To activate minification, set the `isMinify` key to `true` in the configuration file of the [Css](../../reference/core-modules/css/#configuration) or the [Javascript](../../reference/core-modules/javascript/#configuration) module:

```php
<?php

namespace Cherrycake;

$CssConfig = [
    "isMinify" => true,
    "sets" => [
        "main" => [
            "directory" => APP_DIR."/css",
            "isIncludeAllFilesInDirectory" => true
        ]
    ]
];
```

## CSS and JavaScript Caching and versioning

CSS and JavaScript are always cached automatically, and file versioning is automatically taken care of using content-based unique ids. Cherrycake ensures the browser caches the CSS and JavaScript requests, and that it is always receiving their latest versions if they have changed in the last update.

> This ultimately means that you don't need to take care of implementing a caching policy or versioning for your CSS or JavaScript files, and the visitors to your website won't need to clear their caches to load the proper updated CSS and JavaScript files.

## Linking the CSS and JavaScript to your HTML document

If you're using the [HtmlDocument](../htmldocument-guide.md) module to build your HTML document, the proper links to get the required CSS and JavaScript sets are already being added automatically to the `<head>` section of the document:

```markup
...
<link rel="stylesheet" type="text/css" href="/css?set=coreUiComponents:718d83f2e5ae92b539f90f7dc7e3ba24-main:90deae3cd3e3bc042e83c0404f30c69f" />
<script type="text/javascript" src="/js?set=coreUiComponents:d41d8cd98f00b204e9800998ecf8427e-main:d41d8cd98f00b204e9800998ecf8427e"></script>
...
```

> If you're creating your own HTML document structure instead of using the [HtmlDocument](../htmldocument-guide.md) module, you can call the [Css::getSetUrl](../../reference/core-modules/css/css-methods.md#getseturl) and [Javascript::getSetUrl](../../reference/core-modules/javascript/javascript-methods.md#getseturl) methods to retrieve the proper URLs to request the CSS and JavaScript code.

{% hint style="success" %}
A basic example of the usage of the Css module can be seen working in the [Cherrycake documentation examples](https://documentation-examples.cherrycake.io/example/cssAndJavascriptBasicExample) site.
{% endhint %}

