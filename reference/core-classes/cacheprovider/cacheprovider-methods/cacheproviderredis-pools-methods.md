---
description: CacheProvider methods to work with pools.
---

# CacheProviderRedis Pools methods

## isInPool\( poolName, value \)

Checks whether a value is in the pool.

**Parameters:**

* **`poolName`** The pool name
* **`value`** The value to check

**Returns:** True if the value is in the pool, false otherwise

## poolAdd\( poolName, value \)

Adds a value to a pool.

**Parameters:**

* **`poolName`** The pool name
* **`value`** The value to add

**Returns:** Whether the value has been correctly added, false otherwise

## poolCount\( poolName \)

Counts the number of objects in the pool

**Parameters:**

* **`poolName`** The pool name

**Returns:** The number of objects in the pool, or false if the pool doesn't exists.

## poolPop\( poolName, value \)

Retrieves a random value from a pool and removes it.

**Parameters:**

* **`poolName`** The pool name

**Returns:** One of the values in the pool, or false if the pool was empty.

