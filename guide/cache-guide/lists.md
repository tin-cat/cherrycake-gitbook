# Lists

A list is an isolated subset of keys stored in the shared memory of the cache system that can be manipulated at once as a group. For example, you might want store all cached objects related to the user with id `214` in a list named `user_214`, like this:

```php
$userId = 214;
$cacheListName = "user_".$userId;
$e->Cache->huge->hSet($cacheListName, "numberOfVisits", $numberOfVisits);
$e->Cache->huge->hSet($cacheListName, "numberOfFollowers", $numberOfFollowers);
$e->Cache->huge->hSet($cacheListName, "numberOfLikes", $numberOfLikes);
```

Now, when you want to clear the entire cache for a specific user, you don't have to remember all the cache keys you used for that user, you just clear the entire list:

```php
foreach ($e->Cache->huge->hGetAll($cacheListName) as $listKey)
    $e->Cache->huge->hDel($cacheListName, $listKey);
```

Check [Lists methods](../../reference/core-classes/cacheprovider/cacheprovider-methods.md#list-methods) to see more ways to interact with cache lists.

