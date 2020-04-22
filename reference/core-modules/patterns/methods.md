# Methods

## parse**\( patternName, setup \)**

Parses a pattern

**Parameters**

* `patternName` String
* `setup` Optional hash array
  * `directoryOverride` When specified, the pattern is taken from this directory instead of the default configured directory.
  * `noParse` When set to true, the pattern is returned without any parsing.
  * `fileToIncludeBeforeParsing` A file or an array of files to include whenever parsing this set files, usually for defining variables that can be later used inside the pattern.
  * `variables` A hash array of variables passed to be available when parsing the pattern.

**Returns:** The parsed pattern, or false if failed.

## out\( patternName, setup, code \)

Parses a pattern and sets the result as the output response payload.

**Parameters**

* `patternName` String
* `setup` Optional hash array: The options to be passed to the [parse](./#parse-patternname-setup) method
* `code` Optional integer: The response code, one of the available RESPONSE\_\*

\*\*\*\*

\*\*\*\*

