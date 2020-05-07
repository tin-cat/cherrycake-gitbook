---
description: >-
  Provides a way to work with JavaScript in a web application, with additional
  features and performance improvements.
---

# Javascript

> See the [Css and Javascript guide](../../guide/css-and-javascript-guide/) to learn how to work with the Javascript module.

## Configuration

* **`cacheProviderName`** The name of the cache provider to use. Default: `engine`
* **`cachePrefix`** The cache prefix to use when storing JavaScript code. Default: `Javascript`
* **`cacheTtl`**The TTL to use for the cache. Default `CACHE_TTL_LONGEST`
* **`isHttpCache`** Whether to send HTTP Cache headers or not. Default: `false`
* **`httpCacheMaxAge`** The TTL of the HTTP Cache. Default: `CACHE_TTL_LONGEST`
* **`lastModifiedTimestamp`** The timestamp of the last modification to the CSS files, or any other string that will serve as a unique identifier to force browser cache reloading when needed. Default: `false`
* **`defaultSetOrder`** The default order to assign to sets when no order is specified. Default: `100`
* **`isMinify`** Whether to minify the JavaScript code or not

