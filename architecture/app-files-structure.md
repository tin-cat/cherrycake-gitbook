---
description: >-
  Let's take a look at how are directories organized in a typical Cherrycake App
  setup, and the file naming conventions.
---

# Files structure

{% tabs %}
{% tab title="/" %}
The root of your Cherrycake App directory. Can be placed anywhere in your server, a usual choice would be `/var/www/AppName`

In its most basic form, it contains at least one important file:

* **composer.json**
  * Cherrycake uses [composer](https://getcomposer.org/) to manage dependencies. Modify this file to add your own dependencies if needed. To make your Cherrycake application work, the dependency `tin-cat/cherrycake-engine` is required.
{% endtab %}

{% tab title="/modules" %}
Contains your [modules](modules.md), each one in a subdirectory named in the syntax:

`/modules/<ModuleName>`

In that subdirectory, your module must go inside a file named in the syntax:

`/modules/<ModuleName>/<ModuleName>.class.php`

It is recommended that modules follow the naming [conventions](conventions.md). For example, the following module:

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
Note that the `$HomeConfig` variable name in config files must also match the name of the module, with the literal `Config` appended to the end. Check the [Module config files ](../guide/modules/module-config-files.md)documentation for more information.
{% endhint %}
{% endtab %}

{% tab title="/patterns" %}
Contains the HTML files to be used by the [Patterns](../reference/core-modules/patterns.md) module. This directory can be set to anything else by changing the `directory` config key of the [Patterns](../reference/core-modules/patterns.md) module.
{% endtab %}

{% tab title="/public" %}
This is the directory that gets exposed publicly by an HTTP server like NGINX. It must have at least an `index.php` file to load the Cherrycake engine and attend requests.

Check out the [Getting started](../guide/getting-started/) section to learn how to build this index file, or use the readily provided with the [Skeleton](../guide/getting-started/skeleton.md) or [Docker](../guide/getting-started/docker.md) methods.
{% endtab %}
{% endtabs %}

### Other files and directories

There are some other non-required files and directories in a typical Cherrycake app, you'll find some of them there if you create your Cherrycake App using a boilerplate like the [Cherrycake Skeleton](../guide/getting-started/skeleton.md).

{% tabs %}
{% tab title="/" %}
If you've used the [Cherrycake Skeleton](../guide/getting-started/skeleton.md) to start your app, you'll also find this files in your app's root directory:

* **cherrycake**
  * An executable script that allows you to perform a [cli](../guide/cli.md) call to the Cherrycake application from the server command line.
* **LICENSE\_Cherrycake**
  * This contains the license disclaimer for the Cherrycake engine, please keep this file untouched in all your Cherrycake projects.
* **cli.php**
  * A PHP script to launch a [cli](../guide/cli.md) request to the Cherrycake application. This PHP file is used by  the `cherrycake` script.
* **load.php**
  * A convenience loader for the Cherrycake engine, used by any other scripts that need to run the Cherrycake engine, like `cli.php`, or `public/index.php`
{% endtab %}

{% tab title="/usr" %}
Usually, this directory is used to store files uploaded by the users of an app. For example: If your app allows your users to upload their profile images, this is where you could be saving them using the [Image](../reference/core-classes/image.md) core class.
{% endtab %}

{% tab title="/errors" %}
This directory holds the HTML files the [Errors](../reference/core-modules/errors.md) shows to the browser when errors occur. You change this to a different directory by setting the `patternNames` key in the [Errors](../reference/core-modules/errors.md) module configuration file.
{% endtab %}

{% tab title="/install" %}
Some Cherrycake modules make use of the database. This directory contains the SQL files needed to create the database tables needed for those Cherrycake modules.

For example, if you plan to use the [Session](../reference/core-modules/session.md) module to manage your web app user sessions, you'll need to create the `cherrycake_session` table in your database by using the script `session.sql` you'll find in this directory.
{% endtab %}

{% tab title="/vendor" %}
This is the usual directory managed by [Composer](https://getcomposer.org/) to hold all the dependency libraries, including the Cherrycake engine itself.
{% endtab %}
{% endtabs %}

