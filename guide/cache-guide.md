---
description: >-
  The Cache module provides your Cherrycake application with a standardized
  interface to implement caching and shared memory mechanisms into your App by
  connecting to multiple external cache providers.
---

# Cache guide

## Cache providers

To use cache in your application, you must first define a cache provider. Each cache provider connects your app with a different cache mechanism or server, that means your app can make use of different caches at the same time.

Cache providers are configured in the [configuration file for the Cache module](../reference/core-modules/cache/cache-configuration.md), `/config/Cache.config.php`. For example, if you want to use a simple but fast APCu cache provider, your Cache configuration file would look like this:

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

Some Core modules make use of Cache by their own, like [Database](../reference/core-modules/database/) and [Patterns](../reference/core-modules/patterns/). Those modules always accept a configuration key to tell them the name of the cache provider to use, as defined in your `Cache.config.php`

Of course, you can also use cache for whatever other reason you might need. Cache providers are available to use through properties in the [Cache](../reference/core-modules/cache/) module. For example, to set the key `myKey` into the cache provider `fast`, use the [CacheProvider::set](../reference/core-classes/cacheprovider/cacheprovider-methods/#set-key-value-ttl) method, like this:

```php
$value = $e->Cache->fast->set("myKey", "value", \Cherrycake\CACHE_TTL_5_MINUTES);
```

And [CacheProvider::get](../reference/core-classes/cacheprovider/cacheprovider-methods/#get-key) to set a value into a cache key:

```php
$value = $e->Cache->fast->get("myKey")
```

See [CacheProvider methods](../reference/core-classes/cacheprovider/cacheprovider-methods/) for other ways of using the cache.

## Time To Live

Time to Live, or TTL, is a common concept in caching: It represents the amount of time the cached object will be available in the cache. Even though this mechanism might work differently for different cache systems, in general, cached objects are removed automatically from cache when their TTL has passed, so you'll get `false` if you try to access them after that.

> This TTL mechanism is ideal for a lot of simple caching needs: Say you want to cache a calculated value, but you want the cache to be renewed each hour, to keep the calculation in the value relatively up to date. You would store the value in cache with a TTL of one hour, and every time you need to access that value, you would check first if it's in cache. If it is, you use the cached value. If it's not, you calculate a new value and then store it in cache, again with a one hour TTL.

### What about when TTL is zero?

Generally, when an object is stored in cache with a zero TTL, the cache system tries to hold it as long as possible, considering the resources of the server and any persistence mechanisms the server might implement. You should not rely on a zero TTL to store any persistent information.

> As a general rule, do not use cache systems to store persistent information. Use a database instead.

## Other ways of using shared memory

Some specific cache providers like Redis implement other useful ways of working with shared memory. This methods also are designed to store objects in different ways, and stored objects do not have a TTL expiration.

Because this methods also use the shared memory of the cache system, the data you store using them is persistent between requests. This methods are specially suited for high performance operations like the storage of events in a high traffic scenario, or the intermediate storage of data that needs to be accessed extremely fast, lots of times per second.

Let's take a look at the three mechanisms of this type provided by CacheProviderRedis:

## Lists

A list is an isolated subset of keys stored in the shared memory of the cache system that can be manipulated at once as a group. For example, you might want store all cached objects related to the user with id `214` in a list named `user_214`, like this:

```php
$userId = 214;
$cacheListName = "user_".$userId;
$e->Cache->huge->hSet($cacheListName, "numberOfVisits", $numberOfVisits);
$e->Cache->huge->hSet($cacheListName, "numberOfFollowers", $numberOfFollowers);
$e->Cache->huge->hSet($cacheListName, "numberOfLikes", $numberOfLikes);
```

Now, when you want to clear the entire cache for a specific user, you don't have to remember all the cache keys you used for that user, you just clear the entire list:

```php
foreach ($e->Cache->huge->hGetAll($cacheListName) as $listKey)
    $e->Cache->huge->hDel($cacheListName, $listKey);
```

Check [Lists methods](../reference/core-classes/cacheprovider/cacheprovider-methods/lists-methods.md) to see more ways to interact with cache lists.

## Queues

Queues are ordered lists of values. New values can be appended to the end of a queue with [CacheProviderRedis::rPush](../reference/core-classes/cacheprovider/cacheprovider-methods/cacheproviderredis-queueing-methods.md#rpush-queuename-value), or prepended to the beginning with [CacheProviderRedis::lPush](../reference/core-classes/cacheprovider/cacheprovider-methods/cacheproviderredis-queueing-methods.md#lpush-queuename-value). You then can use [CacheProviderRedis::rPop](../reference/core-classes/cacheprovider/cacheprovider-methods/cacheproviderredis-queueing-methods.md#rpop-queuename) to extract a value from the end of the queue and [CacheProvider::lPop](../reference/core-classes/cacheprovider/cacheprovider-methods/cacheproviderredis-queueing-methods.md#lpop-queuename) to extract it from the beginning.

> Queues are great to store events in the same order as they arrive. For example, they're a really efficient way of storing an ordered log of page views, even if your pages get a huge amount of traffic. In a separate process that runs automatically every few minutes, you can then retrieve those page view events and store them in a database for persistence.

## Pools

Pools work a little bit like queues, with the exception of not being ordered. You cannot choose whether to add a value to the beginning of a pool or to the end, you just throw the value into the pool with [CacheProviderRedis::poolAdd](../reference/core-classes/cacheprovider/cacheprovider-methods/cacheproviderredis-pools-methods.md#pooladd-poolname-value), and it stays there. Also, when you get objects from the pool with [CacheProviderRedis::poolPop](../reference/core-classes/cacheprovider/cacheprovider-methods/cacheproviderredis-pools-methods.md#poolpop-poolname-value), you can't choose what object you get, you just get a random one.

One benefit you get when using pools is that you can check if a certain value is in the pool by using [CacheProviderRedis::isInPool](../reference/core-classes/cacheprovider/cacheprovider-methods/cacheproviderredis-pools-methods.md#isinpool-poolname-value), and you can also get the number of values in the pool with [CacheProviderRedis::poolCount](../reference/core-classes/cacheprovider/cacheprovider-methods/cacheproviderredis-pools-methods.md#poolcount-poolname).



