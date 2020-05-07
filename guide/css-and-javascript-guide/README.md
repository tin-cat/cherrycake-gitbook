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
            "directory" => "res/css/main"
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
            "directory" => "res/javascript/main"
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
            "directory" => APP_DIR."/javascript",
            "isIncludeAllFilesInDirectory" => true
        ]
    ]
];
```

> This works exactly the same for the `Javascript.config.php` file.

## Linking the CSS and JavaScript to your HTML document

If you're using the [HtmlDocument](../htmldocument-guide.md) module to build your HTML document, the proper links to get the required CSS and JavaScript sets are already being added automatically to the `<head>` section of the document:

```markup
...
<link rel="stylesheet" type="text/css" href="/css?set=coreUiComponents:718d83f2e5ae92b539f90f7dc7e3ba24" />
<script type="text/javascript" src="/js?set=coreUiComponents:d41d8cd98f00b204e9800998ecf8427e"></script>
...
```

> If you're creating your own HTML document structure instead of using the HtmlDocument module, you can call the [Css::getSetUrl](../../reference/core-modules/css/css-methods.md#getseturl) and [Javascript::getSetUrl](../../reference/core-modules/javascript/javascript-methods.md#getseturl) methods that will give you the proper URLs for your document to request the CSS and JavaScript code.

