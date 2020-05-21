# SystemLog guide

The [SystemLog](../../reference/core-modules/systemlog/) module stores events in a persistent log as they occur, aimed at monitoring failures, warnings and other events that might happen during the execution of the app.

Events are stored in the `cherrycake_systemLog` database table using a shared-memory buffer and a programmed [Janitor](../janitor-guide.md) commit task for optimal performance, resulting in a system capable of ingesting many events per second without a noticeable performance impact.

> You can create the SystemLog table in your database by importing the `systemLog.sql` file you'll find in the [Cherrycake skeleton repository](https://github.com/tin-cat/cherrycake-skeleton), under the `install/database` directory.

[SystemLog](../../reference/core-modules/systemlog/) events are stored as objects that extend the base [SystemLogEvent](../../reference/core-classes/systemlogevent/) class. These are the pre-defined event classes:

* **`SystemLogEventCritical`** Critical events that might interrupt the normal execution of the app.
* **`SystemLogEventError`** Error events that might not interrupt the normal execution of the app.
* **`SystemLogEventHack`** Hacking attempts.
* **`SystemLogEventInfo`** Informative events that might not represent an error.
* **`SystemLogEventWarning`** Warning events that might represent an error, but are not critical enough to be considered errors.

Here's how you trigger a [SystemLog](../../reference/core-modules/systemlog/) event:

```php
$e->SystemLog->event(new \Cherrycake\SystemLogEventError([
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

Many core modules use [SystemLog](../../reference/core-modules/systemlog/) when available to store logs of events. For example:

* The [Errors](../../reference/core-modules/errors.md) module logs the triggered errors as events with the class [SystemLogEventError](../../reference/core-classes/systemlogevent/#subclasses).
* The [Security](../../reference/core-modules/security/) module logs security related issues as events with the class [SystemLogEventHack](../../reference/core-classes/systemlogevent/#subclasses).
* The [Validate](../../reference/core-modules/validate.md) module logs errors found when using external APIs to validate email addresses, as events with the class [SystemLogEventError](../../reference/core-classes/systemlogevent/#subclasses).

## Create your own SystemLog events

You can create your own [SystemLog](../../reference/core-modules/systemlog/) events to differentiate them when analyzing the database, or to provide additional logic to the way your events are described using the additional event data. To do so, create a new class that extends the base [SystemLogEvent](../../reference/core-classes/systemlogevent/) class.

Imagine you've created a function that uses the [OMDb API](https://www.omdbapi.com) to request details about movies, and want to log every request made to the API. You could create a new [SystemLogEvent](../../reference/core-classes/systemlogevent/) called `SystemLogEventOmdbRequest` by creating the file `classes/SystemLogEventOmdbRequest.class.php` like this:

```php
<?php

namespace Cherrycake;

class SystemLogEventOmdbRequest extends SystemLogEvent {
}
```

And you'd be ready to trigger this event every time a request to the OMDb API is done, like this:

```php
$e->SystemLog->event(new SystemLogEventOmdbRequest);
```

But we want to store the movie title along with the event, so we overload the constructor to accept the title as a parameter and pass it along as `data` to the parent [SystemLogEvent](../../reference/core-classes/systemlogevent/) constructor, like this:

```php
<?php

namespace Cherrycake;

class SystemLogEventOmdbRequest extends SystemLogEvent {
    function __construct($movieTitle) {
        parent::__construct([
            "data" => [
                "movieTitle" => $movieTitle
            ]
        ]);
    }
}
```

So now we can trigger the event like this, and the movie title will be stored along with it:

```php
$e->SystemLog->event(new SystemLogEventOmdbRequest("Blade Runner"));
```

