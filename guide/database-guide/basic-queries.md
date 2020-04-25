# Basic queries

Basic queries to a database are done using [DatabaseProvider::query](../../reference/core-classes/databaseprovider/databaseprovider-methods.md#query). Since database providers are available as properties of the Database module, a simple query to a provider named `main` would look like this:

```php
$result = $e->Database->main->query("select * from users");
```

Database queries are returned in the form of a [DatabaseResult](../../reference/core-classes/databaseresult/) object you can manipulate. For example, use the [DatabaseResult::isAny](../../reference/core-classes/databaseresult/databaseresult-methods.md#isany) method to check if there were any results, or the [DatabaseResult::countRows](../../reference/core-classes/databaseresult/databaseresult-methods.md#countrows) to get the number of rows in the result.

To loop through all the rows, iterate over the [DatabaseResult::getRow](../../reference/core-classes/databaseresult/databaseresult-methods.md#getrow) method:

```php
while ($row = $result->getRow()) {
    echo $row->getField("name")."\n";
}
```

Rows are returned as [DatabaseRow](../../reference/core-classes/databaserow.md) objects which, as you can see in the example above, allow you to retrieve information from each row in the results.

