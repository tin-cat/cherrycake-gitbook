# Request methods

## buildUrl\( setup \)

Builds a valid URL for the request.

* **`setup`** A hash array with the following possible keys
  * **`parameterValues`** An optional hash array containing the values for the variable path components and for the GET parameters, if any.
  * **`isIncludeUrlParameters`** Includes the GET parameters in the URL. The passed `parameterValues` will be used, or the current request's parameters if no `parameterValues` are specified. Defaults to `true`.
  * **`isAbsolute`** Whether to generate an absolute url containing additionally http\(s\):// and the domain of the App. Defaults to `false`
  * **`isHttps`** Set it to `true` to generate an https url, `false` to generate an http url or `auto` to auto-detect based on the current request.

**Returns:** A string containing the URL.

