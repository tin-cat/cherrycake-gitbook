---
description: >-
  The Cache module provides your Cherrycake application with a standardized
  interface to implement caching and shared memory mechanisms into your App by
  connecting to multiple external cache providers.
---

# Cache guide

## Cache providers

To use cache in your application, you must first define a cache provider. Each cache provider connects your app with a different cache mechanism or server, that means your app can make use of different caches at the same time.

Cache providers are configured in the [Cache configuration](../../reference/core-modules/cache/) file `/config/Cache.config.php`. For example, if you want to use a simple but fast APCu cache provider, your Cache configuration file would look like this:

```php
<?php

namespace Cherrycake;

$CacheConfig = [
    "providers" => [
        "fast" => [
            "providerClassName" => "CacheProviderApcu"
        ]
    ]
];
```

> Note we called our cache provider `fast`

You can configure more than one cache providers. For example, let's add a Redis cache provider too, called `huge`:

```php
<?php

namespace Cherrycake;

$CacheConfig = [
    "providers" => [
        "fast" => [
            "providerClassName" => "CacheProviderApcu"
        ],
        "huge" => [
            "providerClassName" => "CacheProviderRedis",
            "config" => [
                "scheme" => "tcp",
                "host" => "localhost"
                "port" => 6379,
                "database" => 0,
                "prefix" => "CherrycakeApp:"
            ]
        ]
    ]
];
```

> Since some functionalities of Cherrycake make use of caching mechanisms, there is a default cache provider called `engine` that uses an APCu cache provider. This provider is always defined, no matter what you setup in your `Cache.config.php` file.

## Modules that depend on Cache

Some Core modules make use of Cache by their own, like [Database](../../reference/core-modules/database.md) and [Patterns](../../reference/core-modules/patterns/). Those modules always accept a configuration key to tell them the name of the cache provider to use, as defined in your `Cache.config.php`

## Other ways of using shared memory

Some specific cache providers like Redis implement other useful ways of working with shared memory, like [Lists](lists.md), [Queues](queues.md) and [Pools](pools.md). This methods also are designed to store objects in different ways, and stored objects do not have a TTL expiration.

Because this methods also use the shared memory of the cache system, the data you store using them is persistent between requests. This methods are specially suited for high performance operations like the storage of events in a high traffic scenario, or the intermediate storage of data that needs to be accessed extremely fast, lots of times per second.

