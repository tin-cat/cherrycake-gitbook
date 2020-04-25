# Server requirements

### Minimum requirements

* **Linux** operating system. Other operating systems should work problems but haven't been tested.
* **HTTP Server**, NGINX is recommended, Apache HTTPd should work without problems but hasn't been tested.
* **PHP**, version &gt;= 7
  * **apcu** extension \(`opcache` package\)
  * **json** extension
  * **mbstring** extension \(if not available, use **libonig**\)
* \*\*\*\*[**Composer**](https://getcomposer.org/)\*\*\*\*

### Dependency requirements

* If you're going to use databases \([Database](../reference/core-modules/database/) module\)
  * **MariaDB Server**, MySQL also supported
  * **pdo\_mysql** and **mysqli** PHP extensions
* If you're going to use advanced cache
  * **Redis** **Server**
* If you're going to use Image manipulation \([Image](../reference/core-classes/image.md) class\)
  * **gd** PHP extension
  * **LibJPEG**
  * **LibPNG**
* If you're going to connect to external sources like APIs
  * **openssl**
  * **curl**



