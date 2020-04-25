# Standard queries

The most simple way of executing a query to a database is to use the [DatabaseProvider::query](../../reference/core-classes/databaseprovider.md) method, like this:

```php
$result = $e->Database->main->query("select * from users");
```

This will return a [DatabaseResult](../../reference/core-classes/databaseresult.md) object representing the result of the query. Now you can check whether the query returned any result using the [DatabaseResult::isAny](../../reference/core-classes/databaseresult.md) method.

