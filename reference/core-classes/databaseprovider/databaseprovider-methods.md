# DatabaseProvider methods

## execute\( prepareResult, parameters \)

## prepareAndExecute\( sql, parameters, setup \) <a id="prepareandexecute"></a>

Prepares and executes a prepared query

* **`sql`** The prepared SQL statement.
* **`parameters`** A hash array with the variables to be applied to the prepared SQL statement, in the same order as they're stated in the SQL, with the same structure as in the [DatabaseProvider::execute](databaseprovider-methods.md#execute-prepareresult-parameters) method.
* **`setup`** Optional hash array with options, same specification as the DatabaseResult::$setup



## query\( query, setup \) <a id="query"></a>

Performs a query to the database.

* **`query`** The SQL query string
* **`setup`** An optional hash array with setup options.

