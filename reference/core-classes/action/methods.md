# Action methods

## \_\_construct\( setup \) <a id="__construct"></a>

* **`setup`** A hash array with the following possible keys:
  * **`moduleType`** The type of the module that will be called on this action. Actions can call methods on both Core and App modules, but also on Core and App UiComponents.
  * **`moduleName`** The name of the module that will be called for this action.
  * **`methodName`** The name of the method within the module that will be called for this action. This method must return false if he doesn't accepts the request. It can return true or nothing if the request has been accepted.
  * **`request`** The [Request](../request/) that triggers this Action.
  * **`isCache`** Whether this action must be cached or not.
  * **`isSensibleToBruteForceAttacks`** Whether this action is sensible to brute force attacks or not. For example, an action that checks a given password and returns false if the password is incorrect. In such case, this request will sleep for some time when the password is wrong in order to discourage crackers.
  * **`timeout`** When set, this action must have this specific timeout.
  * **`cacheProviderName`** The name of the cache provider to use when caching this action, defaults to the `defaultActionCacheProviderName` config key for the Actions module.
  * **`cacheTtl`** The TTL to use when caching this action, defaults to the `defaultActionCacheTtl` config key for the Actions module.
  * **`cachePrefix`** The cache prefix to use when caching this action, defaults to the `defaultActionCachePrefix` config key for the Actions module.

## resetCache\( parameterValues \) <a id="resetcache"></a>

Removes this action from cache

* **`parameterValues`** An optional hash array containing the values for the variable path components, parameters and additionalCacheKeys involved in this action's Request. If not specified, the current parameter values will be used.

