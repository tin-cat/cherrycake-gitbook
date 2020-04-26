# Time To Live

Time to Live, or TTL, is a common concept in caching: It represents the amount of time the cached object will be available in the cache. Even though this mechanism might work differently for different cache systems, in general, cached objects are removed automatically from cache when their TTL has passed, so you'll get `false` if you try to access them after that.

> This TTL mechanism is ideal for a lot of simple caching needs: Say you want to cache a calculated value, but you want the cache to be renewed each hour, to keep the calculation in the value relatively up to date. You would store the value in cache with a TTL of one hour, and every time you need to access that value, you would check first if it's in cache. If it is, you use the cached value. If it's not, you calculate a new value and then store it in cache, again with a one hour TTL.

### What about when TTL is zero?

Generally, when an object is stored in cache with a zero TTL, the cache system tries to hold it as long as possible, considering the resources of the server and any persistence mechanisms the server might implement. You should not rely on a zero TTL to store any persistent information.

> As a general rule, do not use cache systems to store persistent information. Use a database instead.

