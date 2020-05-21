---
description: >-
  The SystemLog module stores events in a persistent log as they occur, aimed at
  monitoring failures, warnings and other events that might happen during the
  execution of the app.
---

# SystemLog

> See the [SystemLog guide](../../../guide/systemlog-guide/) to learn how to work with the SystemLog module.

## Configuration

* **`eventsToLog`** An array of the [SystemLogEvent](../../core-classes/systemlogevent/) class names to be stored in the log. The events not listed here will not be logged even if they're triggered. Set it to false to log all events. Default: `false`
* **`tableName`** The name of the table in the database where the log events will be stored. Default: `cherrycake_systemLog`.
* **`cacheProviderName`** The name of the cache provider to use. Default: `engine`.
* **`databaseProviderName`** The name of the database provider to use. Default: `main`.
* **`cacheKeyUniqueId`** The unique cache key to use when storing events into cache. Default: `QueuedSystemLogEvents`.
* **`isQueueInCache`** Whether to store events in a buffer using cache for improved performance instead of storing them in the database straightaway. Default: `true`.

