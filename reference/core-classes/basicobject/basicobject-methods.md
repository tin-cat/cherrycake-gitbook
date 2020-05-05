# BasicObject methods

## treatParameters\( &$parameters, $setup \)

Provides a system to pass complex parameters to a method, where parameters are passed in a hash array instead of the usual parameters passing method. A method using this system should accept a hash array of parameters and pass them as the first parameter to this method via a `parent::treatParameters` call, specifying as a second parameter a setup hash array of options for each parameter to be treated in a special way.

* **`parameters`** The hash array of received parameters.
* **`setup`** A hash array of setup options on how to treat each passed parameter, where each key is the parameter name, and each corresponding value a hash array to setup how that parameter will be treated, with the following possible keys:
  * **`isRequired`** When set to true, the parameter will be required and an error will be thrown if it has not been passed.
  * **`default`** The default value this parameter will take if no value was passed in `$parameters`
  * **`addArrayKeysIfNotExist`** When specified, the passed key-value pairs will be added to $parameters without overwriting any existing keys.
  * **`addArrayValuesIfNotExist`** When specified, the passed values will be added to the specific $parameters key as additional array items.



