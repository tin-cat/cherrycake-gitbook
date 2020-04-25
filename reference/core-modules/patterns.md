# Patterns

{% tabs %}
{% tab title="Configuration" %}
* **`directory`** The directory where patterns are stored.
* **`defaultCacheProviderName`** The default cache provider name to use for cached patterns.
* **`defaultCachePrefix`** The default TTL to use for cached patterns.
* **`defaultCacheTtl`** The default TTL to use for cached patterns.
* **`cachedPatterns`** A hash array of the patterns that will be cached, where each key is the name of the pattern, and each value is a hash array with the following possible keys:
  * **`cacheProviderName`** The cache provider name to use for this pattern. If not specified, it will use the one specified in the`defaultCacheProviderName` config key.
  * **`cachePrefix`** The cache prefix to use for this pattern. If not specified, it will use the one specified in the `defaultCachePrefix` config key.
  * **`cacheTtl`** The cache TTL to use for this pattern. If not specified, it will use the one specified in the `defaultCacheTtl` config key.
{% endtab %}

{% tab title="Methods" %}
## parse**\( patternName, setup \)** <a id="parse"></a>

Parses a pattern

* **`patternName`** String
* **`setup`** Optional hash array
  * **`directoryOverride`** When specified, the pattern is taken from this directory instead of the default configured directory.
  * **`noParse`** When set to true, the pattern is returned without any parsing.
  * **`fileToIncludeBeforeParsing`** A file or an array of files to include whenever parsing this set files, usually for defining variables that can be later used inside the pattern.
  * **`variables`** A hash array of variables passed to be available when parsing the pattern.

**Returns:** The parsed pattern, or false if failed.

## out\( patternName, setup, code \) <a id="out"></a>

Parses a pattern and sets the result as the output response payload.

* **`patternName`** String
* **`setup`** Optional hash array: The options to be passed to the [parse](patterns.md#parse-patternname-setup) method
* **`code`** Optional integer: The response code, one of the available RESPONSE\_\*

\*\*\*\*
{% endtab %}
{% endtabs %}

