---
description: >-
  Cherrycake is capable of handling a high number of requests per second in a
  reasonable server setup, let's take a look at the most important performance
  features and tools it provides.
---

# Performance

### Optimum loading

Modules are loaded only when they're needed, on the fly, and in a per-request basis. This guarantees that each request to the server will only load the code it needs to work, reducing memory usage and latency.

### Four level caching

Cherrycake comes with a solid caching system, implemented in three levels throughout the [lifecycle](lifecycle/) of a request:

* **Request level cache**
  * Each request can be configured to be cacheable, meaning that requests that have been cached will be served much earlier in the request lifecycle, sparing memory and server usage and critically improving latency.
* **Template level cache**
  * Template files, even when they contain logic and PHP code, can be cached. meaning, for example, that you can fine tune specific sections of a web page to be cached while keeping others live. Since Cherrycake templates can work with HTML, CSS, JavaScript and any other kind of files, this template-level caching logic can be used in many creative ways.
* **Item level cache**
  * The logical items of your applications are represented as cacheable objects in Cherrycake called [Items](../reference/core-classes/item.md). Whenever you work with, for example, users from a database or posts in a blog, each user and post can be cached according to your needs, meaning it will load much faster in subsequent requests. Groups of multiple [Items](../reference/core-classes/items.md) like database searches, filtered search results or paged listings can also be cached automatically.
* **Database level cache**
  * For your convenience, all SELECT operations in a database can be cached really easily. You can model your caching logic for database retrieval around your specific needs.

Also, you can use the [Cache](../reference/core-modules/cache.md) system yourself for any other needs you might have. Besides the usual key-value caching methods, it provides a connection-agnostic abstraction layer, object caching, push-pop lists and pooling.

### Web optimizations

Cherrycake automatically minimizes CSS and JavaScript code, it allows you to implement PHP logic into your CSS/JavaScript files and also joins all of them into one single request to improve loading and rendering times.

When needed, images are automatically resized, re-framed and compressed to obtain multiple variants for different purposes.

This loading optimizations, along with the small latencies that can be obtained with the optimized request lifecycle and the multilevel caching benefits, make for web applications with excellent [Google Pagespeed Insights](https://developers.google.com/speed/pagespeed/insights/) ranks.

