---
description: >-
  The Cache module provides your Cherrycake application with a standardized
  interface to implement caching and shared memory mechanisms into your App by
  connecting to multiple external cache providers.
---

# Cache guide

## Cache providers

To use cache in your application, you must first define a cache provider. Each cache provider connects your app with a different cache mechanism or server, that means your app can make use of different caches at the same time.

Cache providers are configured in the [configuration file](modules-guide.md#modules-configuration-file) for the Cache module, `/config/Cache.config.php`. For example, if you want to use a simple but fast APCu cache provider, your Cache configuration file would look like this:

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

You can configure more than one cache providers. For example, let's add a Redis cache provider too, called "huge":

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

## Time To Live

## Prefix

## When to use Action, Pattern, Item or Database-level cache?



