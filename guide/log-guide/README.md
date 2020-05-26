# Log guide

The [Log](../../reference/core-modules/log/) module stores app-related events in a persistent log as they occur, aimed at providing a log of meaningful events that happened in your app, like when a user signs up, an invoice is generated, an API call is received, and whatever other events you deem important enough to be logged for future reference or analysis.

## Setting up the Log database table

Events are stored in the `log` database table using a shared-memory buffer and a programmed [Janitor](../janitor-guide.md) commit task for optimal performance, resulting in a system capable of ingesting many events per second without a noticeable performance impact.

> You can create the `log` table in your database by importing the `log.sql` file you'll find in the [Cherrycake skeleton repository](https://github.com/tin-cat/cherrycake-skeleton), under the `install/database` directory.

## Log events

[Log](../../reference/core-modules/log/) events are stored as objects that extend the base [LogEvent](../../reference/core-classes/logevent/) class, so you create a class for every event you want to log.

Imagine you would like to log an event every time a someone searches for a movie in your app. To do so, we would first create the class `LogEventMovieSearch` in the file `classes/LogEventMovieSearch.class.php` like this:

```php
<?php

namespace CherrycakeApp;

class LogEventMovieSearch extends \Cherrycake\LogEvent {
    protected $typeDescription = "Movie search";
}
```

And we trigger the [LogEvent](../../reference/core-classes/logevent/) like this:

```php
$e->Log->logEvent(new LogEventMovieSearch);
```

[LogEvent](../../reference/core-classes/logevent/) objects can carry some additional data to better describe the event, in our case, we could add the movie title the user searched for, like this:

```php
$e->Log->logEvent(new LogEventMovieSearch([
	"additionalData" => [
		"movieTitle" => "Blade Runner"
	]
]));
```

## Simplifying log events

You can further simplify the way you trigger Log events by overloading your event's constructor. Let's say instead of passing the whole `additionalData` hash array like we did above, we wanted to be able to just pass the movie title and let the constructor take care of it. We would do it like this:

```php
<?php

namespace CherrycakeApp;

class LogEventMovieSearch extends \Cherrycake\LogEvent {
    protected $typeDescription = "Movie search";
    function __construct($movieTitle) {
        parent::__construct([
            "additionalData" => [
                "movieTitle" => $movieTitle
            ]
        ]);
    }
}
```

So now we can trigger the event in this simplified way, and the movie title will be stored along with it:

```php
$e->Log->logEvent(new LogEventMovieSearch("Blade Runner"));
```

