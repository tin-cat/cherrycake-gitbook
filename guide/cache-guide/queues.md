# Queues

Queues are ordered lists of values. New values can be appended to the end of a queue with [CacheProviderRedis::queueRPush](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#queuerpush), or prepended to the beginning with [CacheProviderRedis::queueLPush](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#queuelpush). You then can use [CacheProviderRedis::queueRPop](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#queuerpop) to extract a value from the end of the queue and [CacheProvider::queueLPop](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#queuelpop) to extract it from the beginning.

> Queues are great to store events in the same order as they arrive. For example, they're a really efficient way of storing an ordered log of page views, even if your pages get a huge amount of traffic. In a separate process that runs automatically every few minutes, you can then retrieve those page view events and store them in a database for persistence.

