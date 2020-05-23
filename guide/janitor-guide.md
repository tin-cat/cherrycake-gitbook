---
description: The Janitor module allows an app to program tasks to be executed periodically.
---

# Janitor guide

In many cases you'll need some sort of mechanism to automatically execute tasks with certain periodicity, at certain times of the day, or every few days. The [Janitor](../reference/core-modules/janitor/) module is designed to do exactly that.

Some examples of this kind of tasks are:

* Maintenance tasks, like optimizing a database periodically.
* Batch processes, like gathering all the invoices at the end of the day to generate daily reports.
* Database purges, like removing old data from a database to avoid cluttering it.
* Cache flushes, like periodically clearing certain cached data.
* Buffer commits, like committing data stored in a shared memory buffer to a database for persistence.



