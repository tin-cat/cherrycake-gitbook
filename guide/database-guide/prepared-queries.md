# Prepared queries

Prepared queries are just like regular queries where the variables are stored and check separately instead of being directly appended to the SQL query.

Even though prepared queries are a little more verbose to code, they provide a very important extra layer of security against SQL injection attacks, specially when you're using data coming from user input or other untrusted sources.

{% hint style="warning" %}
Because of the security benefits, you're strongly advised to always use prepared queries instead of basic queries.
{% endhint %}

In prepared queries, instead of specifying your values in the SQL string like this:

```sql
insert into users (name, email) values ('Frank', 'frank.abagnale@united.com');
```

You replace the values with question marks `?` like so:

```sql
insert into users (name, email) values (?, ?);
```

And then pass the values in a separate array to [DatabaseProvider::prepareAndExecute](../../reference/core-classes/databaseprovider/databaseprovider-methods.md#prepareandexecute), this is how it looks.

```sql
$result = $e->Database->main->prepareAndExecute(
    "insert into users (name, email) values (?, ?)",
    [
        [
            "type" => \Cherrycake\Database\DATABASE_FIELD_TYPE_STRING,
            "value" => "Frank"
        ],
        [
            "type" => \Cherrycake\Database\DATABASE_FIELD_TYPE_STRING,
            "value" => "frank.abagnale@united.com"
        ]
    ]
);
```

> See [Database constants](../../reference/core-modules/database.md#constants) for a list of all available field types.



