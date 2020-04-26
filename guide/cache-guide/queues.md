# Queues

Queues are ordered lists of values. New values can be appended to the end of a queue with [CacheProviderRedis::rPush](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#rpush), or prepended to the beginning with [CacheProviderRedis::lPush](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#lpush). You then can use [CacheProviderRedis::rPop](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#rpop) to extract a value from the end of the queue and [CacheProvider::lPop](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#lpop) to extract it from the beginning.

> Queues are great to store events in the same order as they arrive. For example, they're a really efficient way of storing an ordered log of page views, even if your pages get a huge amount of traffic. In a separate process that runs automatically every few minutes, you can then retrieve those page view events and store them in a database for persistence.

