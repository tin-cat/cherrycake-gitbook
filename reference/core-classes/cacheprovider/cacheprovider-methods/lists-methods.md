---
description: CacheProvider methods to work with lists.
---

# CacheProviderRedis Lists methods

## hGet\( listName, key \)

Retrieves an object from a list

**Parameters:**

* **`listName`** The name of the list
* **`key`** The key of the object

**Returns:** The stored value, or null if it doesn't exists.

## hGetKeys\( listName \)

Retrieves all the keys in a list

**Parameters:**

* **`listName`** The name of the list

**Returns:** An array containing all the keys in the list, an empty array if the list was empty or false if the list didn't exist.

## hSet\( listName, key, value\)

Adds an object to a list

**Parameters:**

* **`listName`** The name of the list
* **`key`** The key of the object
* **`value`** The value of the object

**Returns:** True if the key wasn't on the list and it was added. False if the key already existed and it was updated.





