---
description: >-
  Provides a way to work with CSS stylesheets in a web application, with
  additional features and performance improvements.
---

# Css

> Se the [Css and Javascript guide](../../guide/css-and-javascript-guide/) to learn how to work with the Css module.

## Configuration

* **`cacheProviderName`** The name of the cache provider to use. Default: `engine`
* **`cachePrefix`** The cache prefix to use when storing CSS code. Default: `Css`
* **`cacheTtl`**The TTL to use for the cache. Default `CACHE_TTL_LONGEST`
* **`isHttpCache`** Whether to send HTTP Cache headers or not. Default: `false`
* **`httpCacheMaxAge`** The TTL of the HTTP Cache. Default: `CACHE_TTL_LONGEST`
* **`lastModifiedTimestamp`** The timestamp of the last modification to the CSS files, or any other string that will serve as a unique identifier to force browser cache reloading when needed. Default: `false`
* **`defaultSetOrder`** The default order to assign to sets when no order is specified. Default: `100`
* **`isMinify`** Whether to minify the CSS code or not
* **`responsiveWidthBreakpoints`** A hash array of the thresholds that will be used for responsive media queries, where each key is the breakpoint name, and each value the number of pixels. Default:
  * `tiny` `500`
  * `small` `700`
  * `normal` `980`
  * `big` `1300`
  * `huge` `1700`



