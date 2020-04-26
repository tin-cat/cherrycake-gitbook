# Pools

Pools work a little bit like [queues](queues.md), with the exception of not being ordered. You cannot choose whether to add a value to the beginning of a pool or to the end, you just throw the value into the pool with [CacheProviderRedis::poolAdd](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#pooladd), and it stays there. Also, when you get objects from the pool with [CacheProviderRedis::poolPop](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#poolpop-poolname), you can't choose what object you get, you just get a random one.

One benefit you get when using pools is that you can check if a certain value is in the pool by using [CacheProviderRedis::isInPool](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#isinpool), and you can also get the number of values in the pool with [CacheProviderRedis::poolCount](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#poolcount).

