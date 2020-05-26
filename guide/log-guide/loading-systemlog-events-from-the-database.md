# Loading Log events from the database

Since the [LogEvent](../../reference/core-classes/logevent/) class extends the [Item](../../reference/core-classes/item/) class, and the [LogEvents](../../reference/core-classes/logevents/) class extends the [Items](../../reference/core-classes/items/) class, you can use them to load lists of [LogEvent](../../reference/core-classes/logevent/) objects from the database to work with.

For example, let's load the last fifty [LogEvent](../../reference/core-classes/logevent/) objects from the [Log](../../reference/core-modules/log/) database, using what we learned in the [Item lists](../items-guide/item-lists.md) section of the [Items guide](../items-guide/):

```php
$logEvents = new \Cherrycake\LogEvents([
	"p" => [
		"limit" => 50
	]
]);

foreach ($logEvents as $logEvent) {
	echo
		"[".$e->Locale->formatTimestamp($logEvent->dateAdded, ["isHours" => true, "isSeconds" => true])."] ".
		$logEvent->type.
		"\n";
}
```

The [LogEvents](../../reference/core-classes/logevents/) class accepts some additional keys on top of the usual [Items::fillFromParameters](../../reference/core-classes/items/items-methods.md#fillfromparameters) keys:

* **`type`** Retrieves only [LogEvent](../../reference/core-classes/logevent/) objects of this class name. Must include the full namespace route to the class.
* **`fromTimestamp`** Retrieves [LogEvent](../../reference/core-classes/logevent/) objects triggered after this timestamp.
* **`toTimestamp`** Retrieves [LogEvent](../../reference/core-classes/logevent/) objects triggered up to this timestamp.

```text
[5/26/20 11:22.24] CherrycakeApp\LogEventMovieSearch
[5/26/20 10:55.28] CherrycakeApp\LogEventMovieSearch
[5/26/20 10:55.25] CherrycakeApp\LogEventMovieSearch
```

{% hint style="success" %}
See this example working in the [Cherrycake documentation examples](https://documentation-examples.cherrycake.io/example/movieSearchLog) site.
{% endhint %}

