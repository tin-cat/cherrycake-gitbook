# Request methods

## \_\_construct\( setup \) <a id="__construct"></a>

* **`setup`** A hash array of optional setup values with the following possible keys
  * **`isSecurityCsrf`** Whether this request must implement CSRF security or not.
  * **`pathComponents`** An array of RequestPathComponent objects defining the components of this request, in the same order on which they're expected.
  * **`parameters`** An Array of RequestParameter objects of parameters that might be received by this request.
  * **`additionalCacheKeys`** A hash array containing additional cache keys to make this request's cached contents different depending on the values of those keys.

## buildUrl\( setup \) <a id="buildurl"></a>

Builds a valid URL for the request.

* **`setup`** A hash array with the following possible keys
  * **`parameterValues`** An optional hash array containing the values for the variable path components and for the GET parameters, if any.
  * **`isIncludeUrlParameters`** Includes the GET parameters in the URL. The passed `parameterValues` will be used, or the current request's parameters if no `parameterValues` are specified. Defaults to `true`.
  * **`isAbsolute`** Whether to generate an absolute URL containing additionally http\(s\):// and the domain of the App. Defaults to `false`
  * **`isHttps`** Set it to `true` to generate an https URL, `false` to generate an http URL or `auto` to auto-detect based on the current request.

**Returns:** A string containing the URL.

