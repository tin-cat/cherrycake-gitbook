# Stats guide

The [Stats](../reference/core-modules/stats.md) module stores statistical events in a persistent log as they occur, aimed at providing insight about the activity in your app, like counting visits, views, or any other statistical data.

Events are stored in the `cherrycake_stats` database table using a shared-memory buffer and a programmed [Janitor](janitor-guide.md) commit task for optimal performance, resulting in a system capable of ingesting many events per second without a noticeable performance impact.

> You can create the Stats table in your database by importing the `stats.sql` file you'll find in the [Cherrycake skeleton repository](https://github.com/tin-cat/cherrycake-skeleton), under the `install/database` directory.

[Stats](../reference/core-modules/stats.md) events are stored as objects that extend the base StatsEvent class. You must create one StatsEvent class per each statistical data point you want to store.

## What's the difference between a SystemLogEvent and a StatsEvent?

[SystemLog](../reference/core-modules/systemlog/) stores an object in the database for each logged event, allowing individual events to hold their own unique data, but causing the database to grow rapidly when lots of [SystemLogEvent](../reference/core-classes/systemlogevent/) objects are stored.

[Stats](../reference/core-modules/stats.md), in the other hand, stores a single object in the database for all the events triggered during a certain period. This doesn't allows for individual [Stats](../reference/core-modules/stats.md) events to hold their own differentiating data because it only stores the number of times a certain event has been triggered, but makes [Stats](../reference/core-modules/stats.md) a more suitable solution to store big amounts of events, and it's an ideal solution to store statistical data of any kind.

