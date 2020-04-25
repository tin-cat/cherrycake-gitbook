# Security

{% tabs %}
{% tab title="Constants" %}
## Rules

* `SECURITY_RULE_NOT_NULL` The value must be not null, typically used to check whether a parameter has been passed or not. An empty field in a form will not trigger this rule.
* `SECURITY_RULE_NOT_EMPTY` The value must not be empty, typically used to check whether a parameter has been passed or not. An empty field in a form will trigger this rule.
* `SECURITY_RULE_INTEGER` The value must be an integer \(-n to +n without decimals\)
* `SECURITY_RULE_POSITIVE` The value must be positive \(0 to +n\)
* `SECURITY_RULE_MAX_VALUE` The value must be a number less than or equal the specified value
* `SECURITY_RULE_MIN_VALUE` The value must be a number greater than or equal the specified value
* `SECURITY_RULE_MAX_CHARS` The value must be less than or equal the specified number of chars
* `SECURITY_RULE_MIN_CHARS` The value must be bigger than or equal the specified number of chars
* `SECURITY_RULE_BOOLEAN` The value must be either a 0 or a 1
* `SECURITY_RULE_SLUG` The value must have the typical URL slug code syntax, containing only numbers and letters from A to Z both lower and uppercase, and -\_ characters
* `SECURITY_RULE_URL_SHORT_CODE` The value must have the typical URL short code syntax, containing only numbers and letters from A to Z both lower and uppercase
* `SECURITY_RULE_URL_ROUTE` The value must have the typical URL slug code syntax, like `SECURITY_RULE_SLUG` plus the "/" character
* `SECURITY_RULE_LIMITED_VALUES` The value must be exactly one of the specified values.
* `SECURITY_RULE_UPLOADED_FILE` The value must be a valid uploaded file. A value can be specified that must be an array of keys with setup options for the [checkUploadedFile](security.md#checkuploadedfile-file-p) method.
* `SECURITY_RULE_UPLOADED_FILE_IMAGE` The value must be an uploaded image. A value can be specified that must be an array of keys with setup options for the [checkUploadedFile](security.md#checkuploadedfile-file-p) method.
* `SECURITY_RULE_SQL_INJECTION` The value must not contain SQL injection suspicious strings
* `SECURITY_RULE_TYPICAL_ID` Same as `SECURITY_RULE_NOT_EMPTY` + `SECURITY_RULE_INTEGER` + `SECURITY_RULE_POSITIVE`

## Filters

* `SECURITY_FILTER_XSS` The value is purified to try to remove XSS attacks
* `SECURITY_FILTER_STRIP_TAGS` HTML tags are removed from the value
* `SECURITY_FILTER_TRIM` Spaces at the beginning and at the end of the value are trimmed
* `SECURITY_FILTER_JSON` Decodes json data
{% endtab %}

{% tab title="Methods" %}
## checkUploadedFile\( file, p \) <a id="checkuploadedfile"></a>

Checks an uploaded file for security attacks and moves it to a safe place if it is considered secure. It moves the file to a safe place, specified by the returned Result property "`finalPath`".

* When checking uploaded images \(`isRequireImage` or `allowedImageTypes` has been set\), image types other than jpg, gif or png are converted to png.
* When uploading compressed image formats like jpg, since this method generates a new image from the uploaded one for security purposes, the final compression is always set to the maximum possible setting. This will cause compressed images like jpg files to take more disk space than their originals in most cases.



* **`file`** The file array given by PHP after receiving an uploaded file, received via $\_FILES\[name of the file\]
* **`setup`** Optional hash array
  * **`isRequireImage`** Requires the file to be an image. If `allowedImageTypes` is specified, this is forced to true. 
  * **`allowedFileExtensions`** If value is specified with an array of extensions, only those file extensions are allowed. For example: `["pdf", "rtf"]`. If `allowedImageTypes` is specified and this is not, file extensions matching the specific `allowedImageTypes` will be required automatically.
  * **`allowedImageTypes`** If value is specified with an array of IMG\_?, only those image types are allowed \(See [https://www.php.net/manual/en/image.constants.php](https://www.php.net/manual/en/image.constants.php)\). If not specified, all image types supported by GD are accepted.

**Returns:** A [Result](../core-classes/result.md) object with the following payloads:

* **`description`** A description of what went wrong
* **`finalPath`** The complete path where the file was moved if it was considered safe
{% endtab %}
{% endtabs %}

### 

### 

