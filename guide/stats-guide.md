# Stats guide

The [Stats](../reference/core-modules/stats.md) module stores statistical events in a persistent log as they occur, aimed at providing insight about the activity in your app like the number of received visits in a web page, page views, or any other statistical data.

Events are stored in the `cherrycake_stats` database table using a shared-memory buffer and a programmed [Janitor](janitor-guide.md) commit task for optimal performance, resulting in a system capable of ingesting many events per second without a noticeable performance impact.

> You can create the Stats table in your database by importing the `stats.sql` file you'll find in the [Cherrycake skeleton repository](https://github.com/tin-cat/cherrycake-skeleton), under the `install/database` directory.

## Creating a StatsEvent

[Stats](../reference/core-modules/stats.md) events are stored as objects that extend the base [StatsEvent](../reference/core-classes/statsevent/) class. You must create one [StatsEvent](../reference/core-classes/statsevent/) class per each statistical data point you want to store.

Let's say you want to keep track of the number of views received by the home page of your web site app every day. To do so we'll create a new class called `StatsEventHomeView` in the `classes/StatsEventHomeView.class.php` file, like this:

```php
<?php

namespace CherrycakeApp;

class StatsEventHomeView extends \Cherrycake\StatsEvent {
	protected $timeResolution = \Cherrycake\STATS_EVENT_TIME_RESOLUTION_DAY;
	protected $typeDescription = "Home view";
}
```

## What's the difference between a SystemLogEvent and a StatsEvent?

[SystemLog](../reference/core-modules/systemlog/) stores an object in the database for each logged event, allowing individual events to hold their own unique data, but causing the database to grow rapidly when lots of [SystemLogEvent](../reference/core-classes/systemlogevent/) objects are stored.

[Stats](../reference/core-modules/stats.md), in the other hand, stores a single object in the database for all the events triggered during a certain period. This doesn't allows for individual [Stats](../reference/core-modules/stats.md) events to hold their own differentiating data because it only stores the number of times a certain event has been triggered, but makes [Stats](../reference/core-modules/stats.md) a more suitable solution to store big amounts of events, and it's an ideal solution to store statistical data of any kind.

