# Locale methods

## convertTimestamp\( timestamp, toTimeZone, fromTimeZone \) <a id="converttimestamp"></a>

Converts a given timestamp from one timezone to another.

* **`timestamp`** The timestamp to convert. Expected to be in the given `fromTimezone`. 
* **`toTimeZone`** The desired timezone, one of the PHP constants as specified in [http://php.net/manual/en/timezones.php](http://php.net/manual/en/timezones.php). If none specified, the current [Locale](./) timezone is used.
* **`fromTimeZone`** The timezone on which the given `timestamp` is considered to be in. If not specified the default cherrycake timezone is used, as set in [Engine::init](../../core-classes/engine/methods.md#init)

**Returns:** The converted timestamp, or `false` if it couldn't be converted.

## formatCurrency\( amount, setup \) <a id="formatcurrency"></a>

Formats the given amount as a currency.

* **`amount`**
* **`setup`** An optional hash array with setup options, with the following possible keys:
  * **`currency`** The currency to format the given amount to. One of the available [`CURRENCY_?`](./#constants). If not specified, the current [Locale](./) setting is used.

**Returns:** The formatted amount.

## formatDate\( dateTimestamp, setup \) <a id="formatdate"></a>

Formats the given date.

* **`dateTimestamp`** The timestamp to use, in UNIX timestamp format. The hours, minutes and seconds are considered irrelevant.
* **`setup`** An optional hash array with setup options, just like the [Locale::formatTimestamp](locale-methods.md#formattimestamp) method.

**Returns:** The formatted date.

## formatNumber\( number, setup \) <a id="formatnumber"></a>

Formats the given number.

* **`number`**
* **`setup`** An optional hash array with options, with the following possible keys:
  * **`decimals`** The number of decimals to show. Default: `0`
  * **`decimalMark`** The decimal mark to use, either DECIMAL\_MARK\_POINT or DECIMAL\_MARK\_COMMA. Defaults to the current locale setting.
  * **`isSeparateThousands`** Whether to separate thousands or not. Default: `false`
  * **`multiplier`** A multiplier, or false if no multiplier should be applied. Default: `false`

**Returns:** The formatted number.

## formatTimestamp\( timestamp, setup \) <a id="formattimestamp"></a>

Formats the given date/time according to current locale settings.

* **`timestamp`** The timestamp to use, in UNIX timestamp format. Considered to be in the engine's default timezone configured in [Engine::init](../../core-classes/engine/methods.md#init), except if the `fromTimeZone` is given via `setup`.
* **`setup`** A hash array of setup options with the following possible keys:
  * **`fromTimezone`** Considers the given timestamp to be in this timezone. If not specified, the timestamp is considered to be in the current [Locale](./) timestamp. Default: `false`.
  * **`toTimezone`** Converts the given timestamp to this timezone. If not specified, the given timestamp is converted to the current [Locale](./) timestamp except if the `fromTimeZone` setup key has been set to `false`. Default: `false`.
  * **`language`** If specified, this language will be used instead of the detected one. One of the available [`LANGUAGE_?`](./#constants).
  * **`style`** The formatting style, one of the available [`TIMESTAMP_FORMAT_?`](./#constants) constants.
  * **`isShortYear`** Whether to abbreviate the year whenever possible. For example: `17` instead of `2017.` Default: `true`
  * **`isDay`** Whether to include the day. Default: `true`
  * **`isHours`** Whether to include hours and minutes. Default: `false`
  * **`hoursFormat`** The format of the hours. One of the available [`HOURS_FORMAT_?`](./#constants). Default: `HOURS_FORMAT_24`
  * **`isSeconds`** Whether to include seconds. Default: `false`
  * **`isAvoidYearIfCurrent`** Whether to avoid the year if it's the current one. Default: `false`
  * **`isBrief`** Whether to use a brief formatting whenever possible. Default: false.
  * **`format`** If specified this format as used in the date PHP function is used instead of internal formatting. Default: `false`

**Returns:** The formatted timestamp.

## getLanguageCode\( language \) <a id="getlanguagecode"></a>

Gets the code of a language.

* **`language`** The language, one of the available [`LANGUAGE_?`](./#constants) constants.

**Returns:** The language code, or `false` if the specified language is not configured.

## getLanguageName\( language, setup \) <a id="getlanguagename"></a>

Gets the name of a language.

* **`language`** The language, one of the available [`LANGUAGE_?`](./#constants) constants.
* **`setup`** An optional hash array of setup options, with the following possible keys:
  * **`forceLanguage`** Use this language instead of the passed in `language`

**Returns:** The language name, `false` if the specified language is not configured.

## getMainDomain\( localeName \)

Gets the main domain name for the current locale, or for the specified locale

* **`localeName`**  The name of the locale for which to get the main domain

**Returns:** The main domain for the specified locale, or for the current locale if no `locale` specified. `false` if the locale was not found.

## getText\( code, setup \) <a id="gettext"></a>

Gets a text from the multilingual texts database.

* **`code`** The code of the text. Can also be specified in the `<category code>/<text code>` syntax to differentiate texts stored with the same code in different categories.
* **`setup`** An optional hash array of setup options, with the following possible keys:
  * **`variables`** A hash array of the variables that must be replaced taking the text as a pattern. Every occurrence of `{<key>}` will be replaced with the matching value, where the value can be a string, or a hash array of values for different languages, where each key is one of the available [`LANGUAGE_?`](./#constants) constants.
  * **`forceLanguage`** Force the retrieval of the text on this language. If not specified, the detected language is used.
  * **`forceTextCacheTtl`** Use this TTL for the text cache instead of the module configuration variable `textCacheDefaultTtl`.
  * **`isPurifyVariables`** Whether to purify values from specified variables for security purposes or not. Defaults to `true`.

**Returns:** The text.

## setLocale\( localeName \)

Sets the locale to use

* **`localeName`** The name of the locale to use, as specified in the [`availableLocales`](./#configuration) config key.

**Returns:** `true` if the locale could be set, `false` if the locale wasn't configured in the [`availableLocales`](./#configuration) config key.

