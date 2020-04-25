---
description: >-
  Manage the queries to the engine. It answers to queries by evaluating the
  query path and parameters and finding a matching mapped Action.
---

# Actions

## Configuration

* **`defaultActionCacheTtl`** The default cache provider name to use. Default: `engine`
* **`defaultActionCacheTtl`** The default TTL. Default: `CACHE_TTL_NORMAL`
* **`defaultActionCachePrefix`** The default cache prefix. Default: `Actions`
* **`sleepSecondsWhenActionSensibleToBruteForceAttacksFails`** An array containing the minimum and maximum number of seconds to wait when an action marked as sensible to brute force attacks has been executed and failed. Default: `[0, 3]`

