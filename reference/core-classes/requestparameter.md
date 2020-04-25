# RequestParameter

{% tabs %}
{% tab title="Methods" %}
## \_\_construct\( setup \) <a id="__construct"></a>

* **`setup`** A hash array with the following possible keys:
  * **`name`** An name for the parameter, it will let you refer to this component in the future.
  * **`type`** The type of the parameter, from one of the following available types:
    * `REQUEST_PARAMETER_TYPE_GET`
    * `REQUEST_PARAMETER_TYPE_POST`
    * `REQUEST_PARAMETER_TYPE_FILE`
  * **`securityRules`** An array of the security rules that must be applied to the value received by this parameter. See [Working with Security](../../guide/security-guide.md) for a list of all the available rules.
  * **`filters`** An array of the filters that must be applied to the value received by this parameter. See [Working with Security](../../guide/security-guide.md) for a list of all the available filters.
{% endtab %}
{% endtabs %}

