# Security / Methods

## checkUploadedFile\( file, p \)

Checks an uploaded file for security attacks and moves it to a safe place if it is considered secure. It moves the file to a safe place, specified by the returned Result property "`finalPath`".

* When checking uploaded images \(`isRequireImage` or `allowedImageTypes` has been set\), image types other than jpg, gif or png are converted to png.
* When uploading compressed image formats like jpg, since this method generates a new image from the uploaded one for security purposes, the final compression is always set to the maximum possible setting. This will cause compressed images like jpg files to take more disk space than their originals in most cases.

**Parameters:**

* **`file`** The file array given by PHP after receiving an uploaded file, received via $\_FILES\[name of the file\]
* **`setup`** Optional hash array
  * **`isRequireImage`** Requires the file to be an image. If `allowedImageTypes` is specified, this is forced to true. 
  * **`allowedFileExtensions`** If value is specified with an array of extensions, only those file extensions are allowed. For example: `["pdf", "rtf"]`. If `allowedImageTypes` is specified and this is not, file extensions matching the specific `allowedImageTypes` will be required automatically.
  * **`allowedImageTypes`** If value is specified with an array of IMG\_?, only those image types are allowed \(See [https://www.php.net/manual/en/image.constants.php](https://www.php.net/manual/en/image.constants.php)\). If not specified, all image types supported by GD are accepted.

**Returns:** A [Result](../../core-classes/result/) object with the following payloads:

* **`description`** A description of what went wrong
* **`finalPath`** The complete path where the file was moved if it was considered safe

