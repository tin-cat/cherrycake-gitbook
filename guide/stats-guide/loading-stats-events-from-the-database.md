# Loading Stats events from the database

Just like when [loading SystemLogEvents from the database](../log-guide/loading-systemlog-events-from-the-database.md), you can use the provided [StatsEvents](../../reference/core-classes/statsevents/) class to retrieve and work with lists of [StatsEvent](../../reference/core-classes/statsevent/) objects.

For example, let's load the last fifty `StatsEventHomeView` objects from our [earlier example](./), using what we learned in the [Item lists](../items-guide/item-lists.md) section of the [Items guide](../items-guide/):

```php
$statsEventItems = new \Cherrycake\StatsEvents([
    "p" => [
        "type" => "CherrycakeApp\StatsEventHomeView",
        "limit" => 50
    ]
]);

foreach ($statsEventItems as $statsEvent) {
    echo
        $e->Locale->formatTimestamp($statsEvent->timestamp).
        ": ".$statsEvent->typeDescription.
        ": ".$statsEvent->count.
				"\n";
}
```

As you can see, the [StatsEvents](../../reference/core-classes/statsevents/statsevents-methods.md#fillfromparameters) class accepts some additional keys on top of the usual [Items::fillFromParameters](../../reference/core-classes/items/items-methods.md#fillfromparameters) keys:

* **`type`** Retrieves only [StatsEvent](../../reference/core-classes/statsevent/) objects of this class name. Must include the full namespace route to the class.
* **`fromTimestamp`** Retrieves [StatsEvent](../../reference/core-classes/statsevent/) objects triggered after this timestamp.
* **`toTimestamp`** Retrieves [StatsEvent](../../reference/core-classes/statsevent/) objects triggered up to this timestamp.

```text
5/21/20: Home view: 90
5/22/20: Home view: 1
```

{% hint style="success" %}
See examples of loading StatsEvent object from the database in the [Triggering a stats event ](https://documentation-examples.cherrycake.io/example/statsGuideTriggeringEvent)and [Events with additional dimensions](https://documentation-examples.cherrycake.io/example/statsGuideAdditionalDimensions) examples.
{% endhint %}

