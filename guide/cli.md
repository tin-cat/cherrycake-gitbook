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





