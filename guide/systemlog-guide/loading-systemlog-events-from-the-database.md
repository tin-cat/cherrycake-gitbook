# Loading SystemLog events from the database

Since the [SystemLogEvent](../../reference/core-classes/systemlogevent/) class extends the [Item](../../reference/core-classes/item/) class, and the [SystemLogEvents](../../reference/core-classes/systemlogevents.md) class extends the [Items](../../reference/core-classes/items/) class, you can use them to load individual or lists of [SystemLogEvent](../../reference/core-classes/systemlogevent/) objects from the database to work with.

For example, let's load the last fifty [SystemLogEvent](../../reference/core-classes/systemlogevent/) objects from the [SystemLog](../../reference/core-modules/systemlog/) database, using what we learned in the [Item lists](../items-guide/item-lists.md) section of the [Items guide](../items-guide/):

```php
$systemLogEvents = new \Cherrycake\SystemLogEvents([
    "p" => [
		    "limit" => 50
		]
]);

foreach ($systemLogEvents as $systemLogEvent) {
    echo
        "[".$e->Locale->formatTimestamp($systemLogEvent->dateAdded, ["isHours" => true, "isSeconds" => true])."] ".
        $systemLogEvent->type.
        ": ".
        $systemLogEvent->description.
        "\n";
}
```

```text
[5/19/20 14:00.50] SystemLogEventError: App class or module "SystemLogEvents" could not be loaded automatically
[5/19/20 14:00.48] SystemLogEventError: App class or module "SystemLogEvents" could not be loaded automatically
[5/18/20 16:34.57] SystemLogEventError: Requested timezone not found
[5/18/20 16:33.38] SystemLogEventError: Requested timezone not found
[5/18/20 16:28.14] SystemLogEventError: Requested timezone not found
[5/18/20 16:28.13] SystemLogEventError: Requested timezone not found
[5/16/20 16:28.48] SystemLogEventError: Unknown example
[5/16/20 16:28.42] SystemLogEventError: Unknown example
```

{% hint style="success" %}
See this example working in the [Cherrycake documentation examples](https://documentation-examples.cherrycake.io/example/systemLogGuideLoadingEvents) site.
{% endhint %}

