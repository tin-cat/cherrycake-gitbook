# Output

{% tabs %}
{% tab title="Constants" %}
* `RESPONSE_OK`
* `RESPONSE_NOT_FOUND`
* `RESPONSE_NO_PERMISSION`
* `RESPONSE_INTERNAL_SERVER_ERROR`
* `RESPONSE_REDIRECT_MOVED_PERMANENTLY`
* `RESPONSE_REDIRECT_FOUND`
{% endtab %}

{% tab title="Methods" %}
## setResponse\( response \) <a id="setresponse"></a>

Sets the Response object that will be sent to the client

* **`response`** [Response](../core-classes/response.md) object

## sendResponse\( response \) <a id="sendresponse"></a>

Sends the current response. If a response is passed, sets it as the current response and then sends it.

* **`response`** Optional [Response](../core-classes/response.md) object
{% endtab %}
{% endtabs %}

## 

