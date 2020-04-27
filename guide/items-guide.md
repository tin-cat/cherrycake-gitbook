---
description: >-
  Using Items in your Cherrycake application brings you many benefits when
  interacting with the primordial objects of your app, like optimized loading,
  storage, caching and embedded security mechanisms.
---

# Items guide

Items are Cherrycake's conceptualization of the fundamental objects stored in a database. For example, in an e-commerce site, a product would be an Item, but also would a user, a product category or an invoice.

Items always come from a database table, so let's imagine we want to define an [Item](../reference/core-classes/item.md) to work with the products that are stored in our database, in a table with the following fields:

| Field name | Type | Description |
| :--- | :--- | :--- |
| `id` | `unsigned` `int` `auto_increment` `primary key` | The unique id to identify products. |
| `name` | `varchar` | The name of the product. |
| `description` | `text` | A description of the product. |
| `dateAdded` | `datetime` | The date and time the product was added to the database. |





