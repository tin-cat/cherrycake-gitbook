# Using cache

Cache providers are available to use through properties in the [Cache](../../reference/core-modules/cache/) module. For example, to set the key `myKey` into the cache provider `fast`, use the [CacheProvider::set ](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#set)method, like this:

```php
$value = $e->Cache->fast->set("myKey", "value", \Cherrycake\CACHE_TTL_5_MINUTES);
```

And [CacheProvider::get](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#get) to set a value into a cache key:

```php
$value = $e->Cache->fast->get("myKey")
```

See [CacheProvider methods](../../reference/core-classes/cacheprovider/cacheprovider-methods.md) for other ways of using the cache.

