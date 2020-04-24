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
$value = $e->Cache->fast->set("myKey", "value", \Cherrycake\CACHE_TTL_5_MINUTES);
```

And [CacheProvider::get](../reference/core-classes/cacheprovider/cacheprovider-methods.md#get-key) to set a value into a cache key:

```php
$value = $e->Cache->fast->get("myKey")
```

See [Cache methods](../reference/core-modules/cache/cache-methods.md) for other ways of using the cache.

## Time To Live

Time to Live, or TTL, is a common concept in caching: It represents the amount of time the cached object will be available in the cache. Even though this mechanism might work differently for different cache systems, in general, cached objects are removed automatically from cache when their TTL has passed, so you'll get `false` if you try to access them after that.

> This TTL mechanism is ideal for a lot of simple caching needs: Say you want to cache a calculated value, but you want the cache to be renewed each hour, to keep the calculation in the value relatively up to date. You would store the value in cache with a TTL of one hour, and every time you need to access that value, you would check first if it's in cache. If it is, you use the cached value. If it's not, you calculate a new value and then store it in cache, again with a one hour TTL.

### What about when TTL is zero?

Generally, when an object is stored in cache with a zero TTL, the cache system tries to hold it as long as possible, considering the resources of the server and any persistence mechanisms the server might implement. You should not rely on a zero TTL to store any persistent information.

> As a general rule, do not use cache systems to store persistent information. Use a database instead.

## Prefix

Prefixes are used in caching to isolate one set of cache keys from another, mainly to avoid collisions. For example: You might want to store the precalculated number of followers a certain user has in your social network. If you cache this information in a key named `numberOfFollowers`, it will collide with the data for every other user in your system. To distinguish them, you can use the user Id as your prefix, for example: `832`.

> A prefix is simply a string that is prepended to the cache key, so they're equivalent to manually append some prefix to the key. For example: `user832_numberOfFollowers`.

## Cache lists

## When to use Action, Pattern, Item or Database-level cache?



