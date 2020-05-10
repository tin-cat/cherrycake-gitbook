---
description: A simple guide to build a simple "Hello world" application with Cherrycake.
---

# Getting started

For this guide we'll be creating a simple web application with Cherrycake that shows the globally known "Hello world" message in the browser. We won't be using any boilerplates, or assisting tools, so we'll write all the code you need line by line, so you can understand the basics of how Cherrycake works.

First of all, check that your web server meets the [minimum requirements](../../architecture/server-requirements.md) and create a folder for your project.

## Installing the Cherrycake engine

You can simply download the latest version of the engine from [GitHub](https://github.com/tin-cat/cherrycake-engine), but the recommended installation method is using [composer](https://getcomposer.org). To do so, `cd` into your project directory and require the Cherrycake engine using composer:

```bash
composer require tin-cat/cherrycake-engine dev-master
```

This will create the `/vendor` directory in your project, and will install there the Cherrycake engine and all its dependencies.

## The public directory

For security reasons, we'll put all the files that will be served publicly to the Internet in a subdirectory called `/public`. Create this subdirectory now.

## Setting up the web server

Setting up a web server to work with a Cherrycake application it's almost exactly the same as with any other application, except for one detail: We need to tell the web server to redirect all the queries to the index.php file instead of the usual server behavior.

**For NGINX:** Add the following to your virtual host configuration file:

```bash
root /<path_to_your_app>/public;
index index.php;
location / {
    try_files $uri $uri/ /?$query_string;
}
```

**For Apache:** Be sure to point your Virtual Host `DocumentRoot` directive to `/path_to_your_app/public` in your virtual host configuration file and create the file `/public/.htaccess` in your project with the following contents:

```bash
RewriteEngine On
RewriteCond %{DOCUMENT_ROOT}/$1 -f [OR]
RewriteCond %{DOCUMENT_ROOT}/$1 -d
RewriteRule (.*) - [L]
RewriteRule (.*) / [L]
```

## Setting up the skeleton database

It's not required, but some of the most interesting Cherrycake features need a database to work, you'll discover them while you dive in the rest of this guides.

If you're going to use this features, you'll need to install the skeleton database by importing some SQL scripts into your MySQL or MariaDB database server. You'll find this scripts in the official [Cherrycake skeleton repository](https://github.com/tin-cat/cherrycake-skeleton), in the `/install/database` directory.

## Creating the index.php

The `/public/index.php` file will receive all the requests to your app and will be in charge of starting up the Cherrycake engine. Create it now and let's go step by step:

Cherrycake apps need to be declared in a namespace of your choice, or you can use the default `CherrycakeApp` namespace. In any case, we declare the namespace first:

```php
<?php

namespace CherrycakeApp;
```

Now we load the engine. Since it has been installed by composer in a previous step, we do it by including the engine's loader file, called `load.php`:

```php
require "../vendor/tin-cat/cherrycake-engine/load.php";
```

Now we can instantiate the engine. We use the `$e` variable as a convention:

```php
$e = new \Cherrycake\Engine;
```

> Note that the entire Cherrycake engine lives inside the `Cherrycake` namespace, while your application lives in its own different namespace that you declared above. Every time you'll refer to a Cherrycake class or constant you'll need to prefix it with the `\Cherrycake\` namespace like we did here.

Now we call the [Engine::init](../../reference/core-classes/engine/methods.md#init) method to start it up:

```php
if ($e->init(__NAMESPACE__, [
    "appName" => "CherrycakeApp",
    "isDevel" => true,
    "baseCoreModules" => [
        "Actions"
    ]
]))
    $e->attendWebRequest();
```

[Engine::init](../../reference/core-classes/engine/methods.md#init) accepts two parameters. The first must be the namespace of your app. Since we just declared it above, we can pass here the PHP constant `__NAMESPACE__`

The second parameter is an optional hash array that lets you configure some important parameters of the Cherrycake engine. The ones we're using here are: 

* **`appName`** The name of the application. You can skip this and the default name `CherrycakeApp` will be used.
* **`isDevel`** When set to true, the application is put into development mode, meaning you'll get extended error reports and other tricks to help you develop your app. When not specified, this parameter defaults to false.
* **`baseCoreModules`** Is an array of the module names that should be loaded upon initialization of the engine. If not specified, only the [Actions](../../reference/core-modules/actions-1/actions.md) module will be loaded.

> Check the [Engine::init](../../reference/core-classes/engine/methods.md#init) documentation for more configuration parameters when initializing the engine.

Let's take a pause here to see why we've added the [Actions](../../reference/core-modules/actions-1/actions.md) module on the `baseCoreModules` list. We need our app to attend requests \(it would be pretty useless otherwise\), and [Actions](../../reference/core-modules/actions-1/actions.md) is the module in charge of doing exactly that.

By including [Actions](../../reference/core-modules/actions-1/actions.md) in `baseCoreModules`, it will be loaded immediately and, as part of the loading process, it will be initialized by calling the [Actions::init](../../reference/core-modules/actions-1/actions.md#init) method. What this method does in the [Actions](../../reference/core-modules/actions-1/actions.md) module, among other things, is to go through all available modules in both the Cherrycake engine and your app, check if they have a method called `mapActions` and run it.

> It's as if the Actions module asked all other modules: "If you have any actions you would like to map to respond to requests, please let me know now!"

This causes all modules that have some action to map to do so \(by using the [Actions::mapAction](../../reference/core-modules/actions-1/actions.md#mapaction) method\), thus leaving [Actions](../../reference/core-modules/actions-1/actions.md) ready to attend requests.

> Note that there's actually no need to specify a `baseCoreModules` setup key when initializing the engine. If you skip this parameter, the [Actions](../../reference/core-modules/actions-1/actions.md) module will be loaded by default, which is the most common scenario when developing regular apps.

Now, if [Engine::init](../../reference/core-classes/engine/methods.md#init) goes well, we run the [Engine::attendWebRequest](../../reference/core-classes/engine/methods.md#attendwebrequest) method. What this method does is quite simple: By calling the [Actions::run](../../reference/core-modules/actions-1/actions.md#run) method, it asks the [Actions](../../reference/core-modules/actions-1/actions.md) module to go through all mapped actions and run the one that matches the current request.

Lastly, we need to finalize execution by calling the [Engine::end ](../../reference/core-classes/engine/methods.md#end)method, which in turns calls the `end` methods of all the loaded modules, so they can perform any cleaning tasks like disconnecting from external sources:

```php
$e->end();
```

So, our `index.php` file ends looking like this:

```php
<?php

namespace CherrycakeApp;

require "../vendor/tin-cat/cherrycake-engine/load.php";

$e = new \Cherrycake\Engine;

if ($e->init(__NAMESPACE__, [
    "isDevel" => true
]))
    $e->attendWebRequest();

$e->end();
```

> Note that because we're ok with the default configuration parameters for the [Engine::init ](../../reference/core-classes/engine/methods.md#init)call, we've simplified it.

Your Cherrycake app setup is ready, but if you run it now by browsing to your web server address, you'll get an error:

{% hint style="danger" %}
No mapped action found for this request
{% endhint %}

This is quite normal, since we haven't yet configured any actions for Cherrycake to respond to. Let's do it now.

## The "Hello world" module

Four our setup to be complete, we'll tell Cherrycake to attend requests to the `/` route of your web application and respond by showing a simple HTML "Hello world" message.

To do this, we'll create a module called `HelloWorld` that will map an action into the [Actions](../../reference/core-modules/actions-1/actions.md) module.

Create the file `/modules/HelloWorld/HelloWorld.class.php` and edit it so it declares an empty module structure, like this:

```php
<?php

namespace CherrycakeApp\Modules;

class HelloWorld extends \Cherrycake\Module {
}
```

> Remember to use the same namespace you choose for your application in the `/public/index.php` file, plus the \Modules at the end.
>
> Also, don't forget that modules have their own directory inside `/modules`, that directory name must match the module name, even with uppercase and lowercase characters.

To map an action for the `HelloWorld` module so it will respond to requests, declare the static method `mapActions`, and call the[ Actions::mapAction](../../reference/core-modules/actions-1/actions.md#mapaction) method, like this:

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
    
}
```

This will map an action that will respond to requests to the `/` path \(that's why `pathComponents` has been set to false\), and will call the `show` method on the `HelloWorld` module \(the same module we're working on\). Take a look at the [Actions guide](../actions-guide/) to learn about how to map more advanced actions.

If we run our app now, we'll get this error:

{% hint style="danger" %}
Mapped method HelloWorld::show not found
{% endhint %}

Which is quite understandable, because we haven't yet created the show method we told the Action to run. Let's add it now:

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
            "payload" => "<html><body>Hello world</body></html>"
        ]));
    }
    
}
```

To send our "Hello World" HTML code to the client, we send a [ResponseTextHtml](../../reference/core-classes/response.md) object using the [Output::setResponse](../../reference/core-modules/output/methods.md#setresponse) method.

And that's it! If you now run your app you should see a boring yet quite welcoming "Hello world" message in your browser.

> This seems to be a somewhat overkill way of doing what could've been done with a simple `echo "Hello world"` line, isn't it?

Bear with me with the rest of this guide and you'll find this architecture to really come in handy when what you want to accomplish with your app is much more complex than a "Hello World"!

{% hint style="info" %}
All the examples used in this guides are available in the [Cherrycake documentation examples](https://github.com/tin-cat/cherrycake-documentation-examples) repository.
{% endhint %}

