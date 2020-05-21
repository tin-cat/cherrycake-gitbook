---
description: >-
  The Stats module stores statistical events in a persistent log aimed at
  providing insight about the activity in your app.
---

# Stats

> See the [Stats guide](../../guide/stats-guide.md) to learn how to work with the Stats module.

## Configuration

* **`cacheProviderName`** The name of the cache provider to use. Default: `engine`.
* **`databaseProviderName`** The name of the database provider to use. Default: `main`.
* **`cacheKeyUniqueId`** The unique cache key to use when storing stats event into cache. Default: `QueuedSystemLogEvents`.
* **`isQueueInCache`** Whether to store stats events in a buffer using cache for improved performance instead of storing them in the database straightaway. Default: `true`.

