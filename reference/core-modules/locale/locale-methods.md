# Locale methods

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

