---
description: Represents a connection to a cache provider.
---

# CacheProvider

## Subclasses

* **`CacheProviderApcu`** Provides connection to the [Alternative PHP Cache](https://www.php.net/manual/en/book.apc.php), which is easily available as a PHP module and provides high speed, shared memory based caching suited for scenarios without complex cache or shared memory requirements and that won't use big amounts of memory.
* **`CacheProviderMemcached`** Provides connection to a [Memcached](https://www.memcached.org/) server, which provides high performance caching and shared memory capabilities without the need of advanced shared memory tools, suited for scenarios where big amounts of memory will be used, even with distributed server structures.
* **`CacheProviderRedis`** Provides connection to a [Redis](https://redis.io/) server, which provides high performance caching and shared memory capabilities while also providing advanced shared memory mechanisms like lists, queues and pools. Also supports distributed server architectures.

