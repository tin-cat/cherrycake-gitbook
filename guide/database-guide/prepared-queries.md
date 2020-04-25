# Prepared queries

Prepared queries are just like regular queries where the variables are stored and check separately instead of being directly appended to the SQL query.

Even though prepared queries are a little bit verbose to code, they provide a very important extra layer of security against SQL injection attacks, specially when you're using data coming from user input or other untrusted sources.

{% hint style="warning" %}
Because of the security benefits of prepared queries, you're strongly advised to use prepared queries instead of basic queries.
{% endhint %}



