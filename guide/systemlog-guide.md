# SystemLog guide

The [SystemLog](../reference/core-modules/systemlog/) module stores events in a persistent log as they occur, aimed at monitoring failures, warnings and other issues that might happen during the execution of the app.

Events are stored in the `cherrycake_systemLog` database table using a shared-memory buffer and a programmed [Janitor](janitor-guide.md) commit task for optimal performance, resulting in a system capable of ingesting many events per second without a noticeable performance impact.

> You can create the SystemLog table in your database by importing the `systemLog.sql` file you'll find in the [Cherrycake skeleton repository](https://github.com/tin-cat/cherrycake-skeleton), under the `install/database` directory.

Events are stored as objects that extend the base [SystemLogEvent](../reference/core-classes/systemlogevent/) class. These are the pre-defined event classes:

* **`SystemLogEventCritical`** Critical events that might interrupt the normal execution of the app.
* **`SystemLogEventError`** Error events that might not interrupt the normal execution of the app.
* **`SystemLogEventHack`** Hacking attempts.
* **`SystemLogEventInfo`** Informative events that might not represent an error.
* **`SystemLogEventWarning`** Warning events that might represent an error, but are not critical enough to be considered errors.

Here's how you trigger a [SystemLog](../reference/core-modules/systemlog/) event:

```php
$e->SystemLog->event(new SystemLogEventError([
	"description" => "Error when trying to curl Mailboxlayer API to validate an email"
]));
```

SystemLog events can carry some additional data to better describe the event, for example:

```php
$e->SystemLog->event(new SystemLogEventError([
	"description" => "Error when trying to curl Mailboxlayer API to validate an email",
	"data" => [
		"email" => $email,
		"curlError" => curl_error($ch)
	]
]));
```

Many core modules use [SystemLog](../reference/core-modules/systemlog/) when available to store logs of events. For example:

* The [Errors](../reference/core-modules/errors.md) module logs the triggered errors as events with the class [SystemLogEventError](../reference/core-classes/systemlogevent/#subclasses).
* The [Security](../reference/core-modules/security/) module logs security related issues as events with the class [SystemLogEventHack](../reference/core-classes/systemlogevent/#subclasses).
* The [Validate](../reference/core-modules/validate.md) module logs errors found when using external APIs to validate email addresses, as events with the class [SystemLogEventError](../reference/core-classes/systemlogevent/#subclasses).

## Create your own SystemLog events

You can create your own SystemLog events whenever you need, so you'll be able to differentiate them when analyzing the database. To do so, just create a new class that extends the base [SystemLogEvent](../reference/core-classes/systemlogevent/) class. Imagine that you 

