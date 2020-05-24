---
description: The Janitor module allows an app to program tasks to be executed periodically.
---

# Janitor guide

In many cases you'll need some sort of mechanism to automatically execute tasks with certain periodicity, at certain times of the day, every few days or every few minutes. The [Janitor](../reference/core-modules/janitor/) module is designed to do exactly that.

Some examples of the kind of tasks you might want to automate with [Janitor](../reference/core-modules/janitor/) are:

* Maintenance tasks, like optimizing a database periodically.
* Batch processes, like gathering all the invoices at the end of the day to generate daily reports.
* Database purges, like removing old data from a database to avoid cluttering it.
* Cache flushes, like periodically clearing certain cached data.
* Buffer commits, like committing data stored in a shared memory buffer to a database for persistence.

## Janitor tasks

To set up a task to be executed by the [Janitor](../reference/core-modules/janitor/) module, you create a new class that extends the [JanitorTask](../reference/core-classes/janitortask/) core class.





