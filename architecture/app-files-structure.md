---
description: >-
  Let's take a look at how are directories organized in a typical Cherrycake App
  setup, and the file naming conventions.
---

# Files structure

{% tabs %}
{% tab title="/" %}
The root of your Cherrycake App directory. Can be placed anywhere in your server, a usual choice would be `/var/www/AppName`

It contains some important files:

* **cherrycake**
  * An executable script that allows you to perform a [cli](../guide/cli.md) call to the Cherrycake application from the server the command line.
* **composer.json**
  * Cherrycake uses [composer](https://getcomposer.org/) to manage dependencies. Modify this file to add your own dependencies if needed. To make your Cherrycake application work, the dependency `tin-cat/cherrycake-engine` is required.
* **LICENSE\_Cherrycake**
  * This contains the license disclaimer for the Cherrycake engine, please keep this file untouched in all your Cherrycake projects.
* **cli.php**
  * A PHP script to launch a [cli](../guide/cli.md) request to the Cherrycake application. This PHP file is used by  the `cherrycake` script.
* **load.php**
  * A convenience loader for the Cherrycake engine, used by any other scripts that need to run the Cherrycake engine, like `cli.php`, or `public/index.php`
{% endtab %}

{% tab title="/modules" %}
Contains your [modules](modules.md), each one in a subdirectory named in the syntax:

`/modules/<ModuleName>`

In that subdirectory, your module must go inside a file named in the syntax:

`/modules/<ModuleName>/<ModuleName>.class.php`

For example, the following module:

```php
namespace CherrycakeApp\Modules;
class Home extends \Cherrycake\Module {
    [...]
}
```

Must be saved in a file here:

`/modules/Home/Home.class.php`
{% endtab %}

{% tab title="/classes" %}
Contains your [classes](classes.md), each in one file named in the syntax:

`/classes/<ClassName>.class.php`

The file name must match the class name exactly, and it is recommended to follow the naming [conventions](conventions.md). For example, the following class:

```php
namespace CherrycakeApp;
class User extends \Cherrycake\Item {
    [...]
}
```

Must be saved in a file here:

`/classes/User.class.php`
{% endtab %}

{% tab title="/config" %}
Contains the configuration files for your modules, if they need one. The syntax of this files is:

`/config/<ModuleName>.config.php`

For example, the configuration file for the module _Home:_

```php
namespace Cherrycake;
$HomeConfig = [
    [...]
];
```

Must be saved in a file here:

`/config/Home.config.php`

{% hint style="info" %}
Note that the `$HomeConfig` variable name must also match the name of the module, with the literal Config appended to the end. Check the [Module config files ](../guide/user-modules/module-config-files.md)documentation for more information.
{% endhint %}
{% endtab %}

{% tab title="/patterns" %}

{% endtab %}

{% tab title="/public" %}

{% endtab %}
{% endtabs %}

### Other files and directories

There are some other non-required files and directories in a typical Cherrycake app, you'll find some of them there if you create your Cherrycake App using a boilerplate like the [Cherrycake Skeleton](../github.md):

{% tabs %}
{% tab title="/usr" %}

{% endtab %}

{% tab title="/errors" %}
This directory holds the HTML files the [Errors](../reference/core-modules/errors.md) shows to the browser when errors occur. You can configure this in the configuration file of the [Err](../reference/core-modules/errors.md)
{% endtab %}

{% tab title="/install" %}

{% endtab %}

{% tab title="/vendor" %}
This is the usual directory created by [Composer](https://getcomposer.org/) to hold all the dependency libraries, including the Cherrycake engine itself.
{% endtab %}
{% endtabs %}

