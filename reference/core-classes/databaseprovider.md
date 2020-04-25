---
description: >-
  Works in conjunction with the Database module to provide connection to
  different database servers.
---

# DatabaseProvider

## Subclasses

* **`DatabaseProviderMySQL`** Provides connection to MySQL and MariaDB servers.

{% tabs %}
{% tab title="Methods" %}
## query\( sql, setup \) <a id="query"></a>

Performs a query to the database.

* **`sql`** The SQL query string
* **`setup`** Optional array with additional options, See DatabaseResult::$setup
{% endtab %}
{% endtabs %}

