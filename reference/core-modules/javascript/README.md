---
description: >-
  Provides a way to work with JavaScript in a web application, with additional
  features and performance improvements.
---

# Javascript

> See the [Css and Javascript guide](../../../guide/css-and-javascript-guide/) to learn how to work with the Javascript module.

## Configuration

* **`cacheProviderName`** The name of the cache provider to use. Default: `engine`
* **`cacheTtl`**The TTL to use for the cache. Default `CACHE_TTL_LONGEST`
* **`isHttpCache`** Whether to send HTTP Cache headers or not. Default: `false`
* **`httpCacheMaxAge`** The TTL of the HTTP Cache. Default: `CACHE_TTL_LONGEST`
* **`lastModifiedTimestamp`** The timestamp of the last modification to the CSS files, or any other string that will serve as a unique identifier to force browser cache reloading when needed. Default: `false`
* **`defaultSetOrder`** The default order to assign to sets when no order is specified. Default: `100`
* **`isMinify`** Whether to minify the JavaScript code or not
* **`sets`** A hash array specifying the different JavaScript sets this app has, where each key is the set name, and each value is a hash array with the following possible keys:
  * **`order`** The numeric order of this set in relation to other sets. Used to control JavaScript dependency.
  * **`directory`** The directory containing the JavaScript files.
  * **`isIncludeAllFilesInDirectory`** Whether to automatically add all the `*.js` files found in the specified `directory` to this set or not.
  * **`variablesFile`** A PHP file that will be included before any JavaScript pattern parsing.

