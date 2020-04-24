---
description: 'The available configuration keys for this module, and its default values.'
---

# Patterns configuration

* **`directory`** The directory where patterns are stored.
* **`defaultCacheProviderName`** The default cache provider name to use for cached patterns.
* **`defaultCachePrefix`** The default TTL to use for cached patterns.
* **`defaultCacheTtl`** The default TTL to use for cached patterns.
* **`cachedPatterns`** A hash array of the patterns that will be cached, where each key is the name of the pattern, and each value is a hash array with the following possible keys:
  * **`cacheProviderName`** The cache provider name to use for this pattern. If not specified, it will use the one specified in the`defaultCacheProviderName` config key.
  * **`cachePrefix`** The cache prefix to use for this pattern. If not specified, it will use the one specified in the `defaultCachePrefix` config key.
  * **`cacheTtl`** The cache TTL to use for this pattern. If not specified, it will use the one specified in the `defaultCacheTtl` config key.



