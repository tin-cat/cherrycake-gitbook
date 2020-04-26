# Cached patterns

When a pattern is cached, its contents are read from the cache instead of the pattern file. Anything inside the pattern is cached, including any PHP code and nested patterns.

The main reason to cache a pattern is to avoid executing it every time it is used, specially if it contains instructions that are very resource demanding. While the pattern is in cache, it will be served instantly, no matter how long it took to parse it the first time it was used.

When combined with the ability to create structures of nested patterns, cached patterns can become a powerful tool to create high performance websites.

The main way to specify which patterns you want to cache is by adding them to the `cachedPatterns` key in the [Patterns configuration](../../architecture/patterns.md) file, `/config/Patterns.config.php`, like this:

```php
<?php

namespace Cherrycake;

$PatternsConfig = [
    "cachedPatterns" => [
        "helloworld.html" => [
            "cacheTtl" => \Cherrycake\CACHE_TTL_1_MINUTE
        ]
    ]
];
```

This would cause the `helloworld.html` pattern to be parsed the first time it is used, and then stored in cache for one minute. During that minute, every other time the same pattern is used, the cached parsed result will be used instead. After one minute, the TTL will expire and the pattern will be parsed again on the next use. See [Working with Cache](../cache-guide/) for more details on this concepts.

## Removing a pattern from cache

If you want to remove a pattern from the cache before its TTL expiration time arrives, use the [Patterns::clearCache](../../reference/core-modules/patterns/methods.md#clearcache) method, here's an example:

```php
$e->Patterns->clearCache("helloworld.html");
```

