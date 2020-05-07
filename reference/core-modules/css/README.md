---
description: >-
  Provides a way to work with CSS stylesheets in a web application, with
  additional features and performance improvements.
---

# Css

> See the [Css and Javascript guide](../../../guide/css-and-javascript-guide/) to learn how to work with the Css module.

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
* **`sets`** A hash array specifying the different Css sets this app has, where each key is the set name, and each value is a hash array with the following possible keys:
  * **`order`** The numeric order of this set in relation to other sets. Used to control CSS overloading.
  * **`directory`** The directory containing the CSS files.
  * **`isIncludeAllFilesInDirectory`** Whether to automatically add all the `*.css` files found in the specified `directory` to this set or not.
  * **`variablesFile`** A PHP file that will be included before any CSS pattern parsing. It can be used to store styling variables.
  * **`isGenerateTextColorsCssHelpers`** Using the `$textColors` variable defined in the specified `variablesFile` , automatically generates CSS classes in the syntax `.textColor_[color name]` that assign the corresponding CSS text-color property. The `$textColors` variable must be a hash array where the key is the color name, and the value is a [Color](../../core-classes/color.md) object.
  * **`isGenerateBackgroundColorsCssHelpers`** Using the `$backgroundColors` variable defined in the specified `variablesFile` , automatically generates CSS classes in the syntax `.backgroundColor_[color name]` that assign the corresponding CSS background-color property. The `$backgroundColors` variable must be a hash array where the key is the color name, and the value is a [Color](../../core-classes/color.md) object.
  * **`isGenerateBackgroundGradientsCssHelpers`** Using the `$gradients` variable defined in the specified `variablesFile` , automatically generates CSS classes in the syntax `.backgroundGradient_[color name]` that assign the corresponding CSS for a background gradient. The `$gradients` variable must be a hash array where the key is the color name, and the value is a Gradient object.



