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

## Using cache

Some Core modules make use of Cache by their own, like [Database](../reference/core-modules/database.md) and [Patterns](../reference/core-modules/patterns/). Those modules always accept a configuration key to tell them the name of the cache provider to use, as defined in your `Cache.config.php`

Of course, you can also use cache for whatever other reason you might need. Cache providers are available to use through properties in the [Cache](../reference/core-modules/cache/) module. For example, to set the key `myKey` into the cache provider `fast`, use the [CacheProvider::set](../reference/core-classes/cacheprovider/cacheprovider-methods.md#set-key-value-ttl) method, like this:

```php
$value = $e->Cache->fast->set("myKey", "value", );
```

And [CacheProvider::get](../reference/core-classes/cacheprovider/cacheprovider-methods.md#get-key) to set a value into a cache key:

```php
$value = $e->Cache->fast->get("myKey")
```

## Time To Live

## Prefix

## When to use Action, Pattern, Item or Database-level cache?



