# Command line interface

Cherrycake apps can run as command line applications that are invoked from an operating system prompt like the Linux shell.

To let your app attend requests from the command line, you set up an [Action](../reference/core-classes/action/) just like any other, except this time you use the [ActionCli](../reference/core-classes/action/#subclasses) class when mapping it, like this:

```php
$e->Actions->mapAction(
    "helloWorldCli",
    new \Cherrycake\ActionCli([
        "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
        "moduleName" => "HelloWorld",
        "methodName" => "sayHi"
    ])
);
```

And in your method, you use the [ResponseCli](../reference/core-classes/response.md#subclasses) class instead of the usual [ResponseTextHtml](../reference/core-classes/response.md#subclasses) or [ResponseTextPlain](../reference/core-classes/response.md#subclasses):

```php
function sayHi() {
    global $e;
    $e->Output->setResponse(new \Cherrycake\ResponseCli([
        "payload" => "Hello World from the Cli interface"
    ]));
}
```

## Executing CLI Actions

If you remember how we created the `index.php` file in the [Getting started](getting-started/#creating-the-index-php) guide, you'll remember that the method we called to make Cherrycake starting working on the received request actions was [Engine:attendWebRequest](../reference/core-classes/engine/methods.md#attendwebrequest). When creating an app that works in the command line, the method to use is [Engine:attendCliRequest](../reference/core-classes/engine/methods.md#attendclirequest) instead, like this:

```php
<?php

namespace CherrycakeApp;

require "../vendor/tin-cat/cherrycake-engine/load.php";

$e = new \Cherrycake\Engine;

if ($e->init(__NAMESPACE__, [
    "isDevel" => true
]))
    $e->attendCliRequest();

$e->end();
```

## Apps that both attend web requests and CLI actions

Sometimes you'll want your app to attend web requests like a normal web application, but also attend some CLI actions that you'll use to perform maintenance work, run batch processes or similar tasks that are triggered by an admin from the command line, and not by a client using a browser.

A common solution is to create a `cli.php` file additionally to the `index.php` file. This cli.php will look more or less equal to your existing `index.php`, but it will call the [Engine:attendCliRequest](../reference/core-classes/engine/methods.md#attendclirequest) instead of [Engine:attendWebRequest](../reference/core-classes/engine/methods.md#attendwebrequest) method.

The [Cherrycake Skeleton repository](https://github.com/tin-cat/cherrycake-skeleton) provides a `cli.php` file where you'll see this solution at work.

## Running an app from the command line

To run a Cherrycake app from the command line in Linux, you use the [PHP cli](https://www.php.net/manual/en/features.commandline.introduction.php) executable to run the `cli.php` file \(or whatever name you choose for your main `.php` file\), and pass the [Action](../reference/core-classes/action/) name as the first parameter.

Following our example above, to run `helloWorldCli` [Action](../reference/core-classes/action/), we would call Cherrycake from the Linux command line like this:

```bash
php -f ./cli.php helloWorldCli
```

```text
Hello World from the Cli interface
```

## Passing parameters to CLI actions

Just like regular Actions can receive GET and POST parameters, CLI actions can receive command line parameters. To map an [ActionCli](../reference/core-classes/action/#subclasses) that receives parameters, you pass the `parameters` array when creating the [Request](../reference/core-classes/request/) object just like you already did in the [Accept GET or POST parameters](actions-guide/accept-get-or-post-parameters.md) of the [Actions Guide](actions-guide/), except this time you use the [`REQUEST_PARAMETER_TYPE_CLI`](../reference/core-classes/requestparameter/#constants) parameter type instead of `REQUEST_PARAMETER_TYPE_GET` or `REQUEST_PARAMETER_TYPE_POST`, like this:

```php
$e->Actions->mapAction(
    "userFlushCache",
    new \Cherrycake\ActionCli([
        "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
        "moduleName" => "Users",
        "methodName" => "flushUserCacheCli",
        "parameters" => [
            new \Cherrycake\RequestParameter([
                "type" => \Cherrycake\REQUEST_PARAMETER_TYPE_CLI,
                "name" => "userId",
                "securityRules" => [
                    \Cherrycake\SECURITY_RULE_TYPICAL_ID
                ]
            ])
        ]
    ])
);
```

And you receive the parameters just like you do with GET or POST:

```php
function flushUserCacheCli($request) {
    global $e;
    $user = new User([
        "loadMethod" => "fromId",
        "id" => $request->id
    ]);
    $user->clearCache();
    $e->Output->setResponse(new \Cherrycake\ResponseCli([
        "payload" => "Cache for user ".$request->userId." flushed"
    ]));
}
```

Now, to call a CLI action that accepts parameters from the command line, you use the regular UNIX parameters syntax after the action name, like this:

```bash
php -f ./cli.php userFlushCache --userId=832
```

```text
Cache for user 832 flushed
```

