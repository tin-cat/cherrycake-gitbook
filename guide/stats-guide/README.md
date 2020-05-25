# Stats guide

The [Stats](../../reference/core-modules/stats/) module stores statistical events in a persistent log as they occur, aimed at providing insight about the activity in your app like the number of received visits in a web page, page views, or any other statistical data.

## Setting up the Stats database table

Events are stored in the `cherrycake_stats` database table using a shared-memory buffer and a programmed [Janitor](../janitor-guide.md) commit task for optimal performance, resulting in a system capable of ingesting many events per second without a noticeable performance impact.

> You can create the Stats table in your database by importing the `stats.sql` file you'll find in the [Cherrycake skeleton repository](https://github.com/tin-cat/cherrycake-skeleton), under the `install/database` directory.

## Creating a StatsEvent

[Stats](../../reference/core-modules/stats/) events are stored as objects that extend the base [StatsEvent](../../reference/core-classes/statsevent/) class. You must create one [StatsEvent](../../reference/core-classes/statsevent/) class per each statistical data point you want to store.

Let's say you want to keep track of the number of views received by the home page of your web site app every day. To do so we'll create a new class called `StatsEventHomeView` in the `classes/StatsEventHomeView.class.php` file, like this:

```php
<?php

namespace CherrycakeApp;

class StatsEventHomeView extends \Cherrycake\StatsEvent {
	protected $timeResolution = \Cherrycake\STATS_EVENT_TIME_RESOLUTION_DAY;
	protected $typeDescription = "Home view";
}
```

Note that we specified [`STATS_EVENT_TIME_RESOLUTION_DAY`](../../reference/core-classes/statsevent/#constants) as the `timeResolution` for our `StatsEventHomeView`. This will cause this event to be counted in a daily basis, meaning only one row will be stored in the database for each different day, along containing a counter of the number of times the event has been triggered during that day.

You can specify other time resolutions as well, all of them are self-explanatory:

* **`STATS_EVENT_TIME_RESOLUTION_MINUTE`**
* **`STATS_EVENT_TIME_RESOLUTION_HOUR`**
* **`STATS_EVENT_TIME_RESOLUTION_DAY`**
* **`STATS_EVENT_TIME_RESOLUTION_MONTH`**
* **`STATS_EVENT_TIME_RESOLUTION_YEAR`**

You should choose the time resolution that better fits your needs, keeping in mind that events defined with a smaller time resolution will need more rows in the database.

> If you need a precise log of events instead of the statistical approach of counting the times an event is triggered within a time frame, use the [SystemLog](../systemlog-guide/) module instead.

## Triggering a Stats event

In the part of your code where you want to trigger the stats event, call the [Stats::trigger](../../reference/core-modules/stats/stats-methods.md#trigger-statsevent) method like this:

```php
$e->Stats->trigger(new StatsEventHomeView);
```

{% hint style="success" %}
See this example working in the [Cherrycake documentation examples](https://documentation-examples.cherrycake.io/example/statsGuideTriggeringEvent) site.
{% endhint %}

## What's the difference between a SystemLogEvent and a StatsEvent?

[SystemLog](../../reference/core-modules/systemlog/) stores an object in the database for each logged event, allowing individual events to hold their own unique data, but causing the database to grow rapidly when lots of [SystemLogEvent](../../reference/core-classes/systemlogevent/) objects are stored.

[Stats](../../reference/core-modules/stats/), in the other hand, stores a single object in the database for all the events triggered during a certain period. This doesn't allows for individual [Stats](../../reference/core-modules/stats/) events to hold their own differentiating data because it only stores the number of times a certain event has been triggered, but makes [Stats](../../reference/core-modules/stats/) a more suitable solution to store big amounts of events, and it's an ideal solution to store statistical data of any kind.

