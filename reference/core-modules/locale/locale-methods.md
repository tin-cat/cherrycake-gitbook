# Locale methods

## convertTimestamp\( timestamp, toTimeZone, fromTimeZone \)

Converts a given timestamp from one timezone to another.

* **`timestamp`** The timestamp to convert. Expected to be in the given `fromTimezone`. The default cherrycake TIMEZONE configuration is considered as `fromTimezone` if not specified \(Usually `Etc/UTC`\)

## getLanguageCode\( language \)

Gets the code of a language.

* **`language`** The language, one of the available [`LANGUAGE_?`](./#constants) constants.

**Returns:** The language code, or `false` if the specified language is not configured.

## getLanguageName\( language, setup \)

Gets the name of a language.

* **`language`** The language, one of the available [`LANGUAGE_?`](./#constants) constants.
* **`setup`** An optional hash array of setup options, with the following possible keys:
  * **`forceLanguage`** Use this language instead of the passed in `language`

**Returns:** The language name, `false` if the specified language is not configured.

## getText\( code, setup \)

Gets a text from the multilingual texts database.

* **`code`** The code of the text. Can also be specified in the `<category code>/<text code>` syntax to differentiate texts stored with the same code in different categories.
* **`setup`** An optional hash array of setup options, with the following possible keys:
  * **`variables`** A hash array of the variables that must be replaced taking the text as a pattern. Every occurrence of `{<key>}` will be replaced with the matching value, where the value can be a string, or a hash array of values for different languages, where each key is one of the available [`LANGUAGE_?`](./#constants) constants.
  * **`forceLanguage`** Force the retrieval of the text on this language. If not specified, the detected language is used.
  * **`forceTextCacheTtl`** Use this TTL for the text cache instead of the module configuration variable `textCacheDefaultTtl`.
  * **`isPurifyVariables`** Whether to purify values from specified variables for security purposes or not. Defaults to `true`.

**Returns:** The text.

