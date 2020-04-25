# Basic queries

Basic queries to a database are done using [DatabaseProvider::query](../../reference/core-classes/databaseprovider/databaseprovider-methods.md#query). Since database providers are available as properties of the Database module, a simple query to a provider named `main` would look like this:

```php
$result = $e->Database->main->query("select * from users");
```

Database queries are returned in the form of a DatabaseResult object.

