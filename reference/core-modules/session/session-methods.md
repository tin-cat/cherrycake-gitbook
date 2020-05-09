# Session methods

## \_\_get\( key \)

Magic method to get a data key from the session.

* **`key`** The data key to retrieve

**Returns:** The requested value from the session

## \_isset\( key \) <a id="issessiondata"></a>

Magic method to check whether a session data key has been set or not.

* **`key`** The data key to check

**Returns:** True if the data key exists in the session, false if not.

## \_\_set\( key, value \) <a id="setsessiondata"></a>

Magic method to store a value with the given key in the session data. It does it both in the hashed list cache and on the database for persistence.

* **`key`** The data key to store
* **`value`** The value to store

**Returns:** Whether the value could be stored or not.

## \_\_unset\( key \)

Magic method to remove the given key from the session.

* **`key`** The data key to remove

