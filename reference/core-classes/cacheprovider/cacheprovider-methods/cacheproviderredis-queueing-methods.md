---
description: CacheProvider methods to work with queues.
---

# CacheProviderRedis Queueing methods

## lPop\( queueName \)

Returns the element at the beginning of a queue and removes it.

**Parameters:**

* **`queueName`** The name of the queue

**Returns:** The value that was a the beginning of the queue, or null if the queue was empty.

## lPush\( queueName, value \)

Prepends a value to the beginning of a queue.

**Parameters:**

* **`queueName`** The name of the queue
* **`value`** The value to prepend

**Returns:** True if everything went ok, false otherwise

## rPop\( queueName \)

Returns the element at the end of a queue and removes it.

**Parameters:**

* **`queueName`** The name of the queue

**Returns:** The value that was a the end of the queue, or null if the queue was empty.

## rPush\( queueName, value \)

Appends a value to the end of a queue.

**Parameters:**

* **`queueName`** The name of the queue
* **`value`** The value to append

**Returns:** True if everything went ok, false otherwise

