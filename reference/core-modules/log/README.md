---
description: >-
  The Log module stores app-related events in a persistent log as they occur,
  aimed at providing a log of meaningful events that happened in the app.
---

# Log

> See the [Log guide](../../../guide/log-guide/) to learn how to work with the Log module.

## Configuration

* **`databaseProviderName`** The name of the database provider where the `log` table is found. Default: `main`.
* **`cacheProviderName`** The name of the cache provider that will be used to temporally store events as they happen, to be later added to the database by the `JanitorTaskLog`. Default: `engine`.
* **`cacheKeyUniqueId`** The unique cache key to use when storing events into cache. Default: `QueuedLogEvents`
* **`isQueueInCache`** Whether to store events in a buffer using cache for improved performance instead of storing them in the database straightaway.

