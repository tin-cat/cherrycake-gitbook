# Loading SystemLog events from the database

Since the [SystemLogEvent](../../reference/core-classes/systemlogevent/) class extends the [Item](../../reference/core-classes/item/) class, and the [SystemLogEvents](../../reference/core-classes/systemlogevents.md) class extends the [Items](../../reference/core-classes/items/) class, you can use them to load individual or lists of [SystemLogEvent](../../reference/core-classes/systemlogevent/) objects from the database to work with.

For example, let's load the last fifty [SystemLogEvent](../../reference/core-classes/systemlogevent/) objects from the [SystemLog](../../reference/core-modules/systemlog/) database, using what we learned in the [Item lists](../items-guide/item-lists.md) section of the [Items guide](../items-guide/):

```php
$systemLogEvents = new SystemLogEvents([
    "fillMethod" => "fromParameters",
    "p" => []
]);
```

