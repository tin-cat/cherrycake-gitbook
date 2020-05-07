# Css and Javascript guide

The [Css](../../reference/core-modules/css/) and [Javascript](../../reference/core-modules/javascript.md) core modules allow you to easily work with CSS and JavaScript files in your web page project with some neat additional features:

* CSS and JavaScript files are parsed as [patterns](../../architecture/patterns/).
* Automatic minimization and single-request serving of multiple files.
* Cached CSS and JavaScript.
* Modules inject the CSS and JavaScript code they themselves.
* CSS and JavaScript dependencies via modules.
* Works in conjunction with [HtmlDocument](../../reference/core-modules/htmldocument/) to automatically link the needed CSS/JavaScript resources in the HTML document.

## Css and Javascript sets

When using the [Css](../../reference/core-modules/css/) or the [Javascript](../../reference/core-modules/javascript.md) modules, you first define at least one set that will contain the `*.css` and `*.js` files you'll be using.

Sets are defined in the Css and Javascript modules configuration files: `/config/Css.config.php` and `/config/Javascript.config.php`.

Each set gets its files from the directory you've configured. Even though you can add CSS or JavaScript files to your sets directly in the configuration file.

