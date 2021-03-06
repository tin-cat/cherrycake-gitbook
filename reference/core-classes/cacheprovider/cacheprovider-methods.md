# CacheProvider methods

## Basic cache methods

## get\( key \) <a id="get"></a>

Gets a value from the cache.

* **`key`** The identifier key

**Returns:** The stored value on the specified key, or false if it didn't exist.

## set\( key, value, ttl \) <a id="set"></a>

Stores a value into the cache

* **`key`** The identifier key
* **`value`** The value
* **`ttl`** The [Time To Live](../../../guide/cache-guide/#time-to-live) of the stored value in seconds. Default: `false`

**Returns:** Whether the value has been correctly stored, false otherwise.

## List methods

## listGet\( listName, key \) <a id="listget"></a>

Retrieves an object from a list

* **`listName`** The name of the list
* **`key`** The key of the object

**Returns:** The stored value, or null if it doesn't exists.

## listGetKeys\( listName \) <a id="listgetkeys"></a>

Retrieves all the keys in a list

* **`listName`** The name of the list

**Returns:** An array containing all the keys in the list, an empty array if the list was empty or false if the list didn't exist.

## listSet\( listName, key, value\) <a id="listset"></a>

Adds an object to a list

* **`listName`** The name of the list
* **`key`** The key of the object
* **`value`** The value of the object

**Returns:** True if the key wasn't on the list and it was added. False if the key already existed and it was updated.

## Queue methods

## queueLPop\( queueName \) <a id="queuelpop"></a>

Returns the element at the beginning of a queue and removes it.

* **`queueName`** The name of the queue

**Returns:** The value that was a the beginning of the queue, or null if the queue was empty.

## queueLPush\( queueName, value \) <a id="queuelpush"></a>

Prepends a value to the beginning of a queue.

* **`queueName`** The name of the queue
* **`value`** The value to prepend

**Returns:** True if everything went ok, false otherwise

## queueRPop\( queueName \) <a id="queuerpop"></a>

Returns the element at the end of a queue and removes it.

* **`queueName`** The name of the queue

**Returns:** The value that was a the end of the queue, or null if the queue was empty.

## queueRPush\( queueName, value \) <a id="queuerpush"></a>

Appends a value to the end of a queue.

* **`queueName`** The name of the queue
* **`value`** The value to append

**Returns:** True if everything went ok, false otherwise

## Pool methods

## isInPool\( poolName, value \) <a id="isinpool"></a>

Checks whether a value is in the pool.

* **`poolName`** The pool name
* **`value`** The value to check

**Returns:** True if the value is in the pool, false otherwise

## poolAdd\( poolName, value \) <a id="pooladd"></a>

Adds a value to a pool.

* **`poolName`** The pool name
* **`value`** The value to add

**Returns:** Whether the value has been correctly added, false otherwise

## poolCount\( poolName \) <a id="poolcount"></a>

Counts the number of objects in the pool

* **`poolName`** The pool name

**Returns:** The number of objects in the pool, or false if the pool doesn't exists.

## poolPop\( poolName \)

Retrieves a random object of the pool and removes it.

* **`poolName`** The pool name

**Returns:** The object, or null if the pool was empty.





