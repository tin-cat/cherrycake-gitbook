# RequestPathComponent methods

## \_\_construct\( setup \) <a id="__construct"></a>

* **`setup`** A hash array with the following possible keys:
  * **`name`** A name for the path component, it will let you refer to this component in the future.
  * **`type`** The type of the component, from one of the following available types:
    * `REQUEST_PATH_COMPONENT_TYPE_FIXED`
    * `REQUEST_PATH_COMPONENT_TYPE_VARIABLE_STRING`
    * `REQUEST_PATH_COMPONENT_TYPE_VARIABLE_NUMERIC`
  * **`string`** For `REQUEST_PATH_COMPONENT_TYPE_FIXED` type path components, the exact text on this part of the path.
  * **`securityRules`** An array of the security rules that must be applied to the value received by this path component. See [Working with Security]() for a list of all the available rules.
  * **`filters`** An array of the filters that must be applied to the value received by this path component. See [Working with Security]() for a list of all the available filters.

