# HtmlDocument methods

## footer

Builds a standard HTML footer, from the &lt;/body&gt; to the &lt;/html&gt; tags. Works with the Javascript module to implement deferred JavaScript capabilities.

**Returns:** The HTML footer

## header\( setup \) <a id="header"></a>

Builds a standard HTML header, from the `<html ... >` to the `<body ...>` tags. It works with the [Css](../css/) and [Javascript](../javascript/) modules to include the proper CSS/JavaScript calls.

* **`setup`** An optional hash array of the following optional setup keys:
  * **`bodyAdditionalCssClasses`** Additional CSS classes for the body element. Default: `false`

**Returns:** The HTML header

