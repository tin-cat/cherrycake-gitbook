---
description: Helps you create standard HTML headers and footers.
---

# HtmlDocument

> See the [HtmlDocument guide](../../../guide/htmldocument-guide.md) to learn how to work with the HtmlDocument module.

## Configuration

* **`title`** The page title
* **`description`** The page description
* **`copyright`**The page copyright info
* **`keywords`** An array of the page keywords
* **`languageCode`** The language code of the page, from the ISO 639-1 standard \([https://www.w3schools.com/tags/ref\_language\_codes.asp](https://www.w3schools.com/tags/ref_language_codes.asp)\). Default: `en`
* **`charset`** The page character set. Default: `utf-8`
* **`isAllowRobotsIndex`** Whether to allow robots to index the document. Default: `true`
* **`isAllowRobotsFollow`**Whether to allow robots to follow links on the document. Default: `true`
* **`isDeferJavascript`** Whether to defer loading of JavaScript or not. Default: `false`
* **`googleAnalyticsTrackingId`** The Google Analytics id, if any.
* **`matomoTrackingId`** The Matomo \(Piwik\) tracking id, if any.
* **`matomoServerUrl`** The Matomo \(Piwik\) server URL, if any.
* **`mobileViewport`** Configuration for the site when viewed in a mobile device, via the `viewport` meta
  * `width` The width of the viewport: A number of pixels or `device-width`. Default: `device-width`
  * `userScalable` Whether or not to let the user pinch to zoom in/out. Default: `true`
  * `initialScale` Optional, the initial scale
  * `maximumScale` Optional, the maximum scale
* **`microsoftApplicationInfo`** Application info for Microsoft standards \(i.e: When adding the web as a shortcut in Windows &gt;8\)
  * `name` The name of the app
  * `tileColor` The color of the tile on Windows &gt;8, in HTML hexadecimal format \(i.e: `#dd2153`\)
  * `tileImage` URL of an image to use as a tile image for Windows &gt;8. Must be in png format.
* **`appleApplicationInfo`** Application info for Apple standards \(i.e: When adding the web as a shortcut in iOs devices, or to hint the users about the App store APP for this site\)
  * `name` The name of the app
  * `iTunesAppId`
  * `icons` A hash array of icon sizes where the key is in the \[width\]x\[height\] syntax and the value is the icon URL in png format. The standard keys to use here are:`57x57` ,`114x114` ,`72x72` ,`144x144` ,`60x60` ,`120x120` ,`76x76` and `152x152`. Default: `false`
* **`iTunesAppId`** The id of a corresponding App in the Apple store. Default: `false`
* **`favIcons`** A hash array of icon sizes where the key is in the \[width\]x\[height\] syntax and the value is the icon URL in png format. The standard keys to use here are:`196x196`, `160x160`, `96x96`, `16x16` and `32x32`. Default: `false`
* **`cssSets`** An array of the Css set names to link in the HTML document in a single request, or, to add different Css requests instead of one, an array where each item represents a single request, and is an array of Css set names that will be included in each single request. If set to `false`, all available sets will be linked in a single request. Default: `false`
* **`javascriptSets`** An array of the Javascript set names to link in the HTML document in a single request, or, to add different Javascript requests instead of one, an array where each item represents a single request, and is an array of Javascript set names that will be included in each single request. If set to `false`, all available sets will be linked in a single request. Default: `false`
* **`googleFonts`**An array of the Google fonts to include, where each item is a hash array containing the following keys:
  * `family` The font family \(i.e: `Duru Sans`\)
  * `weight` The font weight \(i.e: `300`\)
  * `subset` The subset \(i.e: `latin`\)

