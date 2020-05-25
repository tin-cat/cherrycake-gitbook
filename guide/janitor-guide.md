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

## Setting up the Janitor database table

Janitor uses the `cherrycake_janitor_log` database table to store information about the executed tasks.

> You can create the Janitor table in your database by importing the `janitor.sql` file you'll find in the [Cherrycake skeleton repository](https://github.com/tin-cat/cherrycake-skeleton), under the `install/database` directory.

## Janitor tasks

To set up a task to be executed by the [Janitor](../reference/core-modules/janitor/) module, you first create a new class that extends the [JanitorTask](../reference/core-classes/janitortask/) core class.

Imagine we wanted to create a task to update the IMDB rating of the movies in the database every day. To do so, we would create the file `classes/JanitorTaskMoviesUpdateImdbRating.class.php` like this:

```php
<?php

namespace CherrycakeApp;
    
class JanitorTaskMoviesUpdateImdbRating extends \Cherrycake\JanitorTask {
    protected $config = [
    		"executionPeriodicity" => \Cherrycake\JANITORTASK_EXECUTION_PERIODICITY_HOURS,
		    "periodicityHours" => ["00:00"]
    ];
    protected $name = "Movies update IMDB rating";
    protected $description = "Updates the IMDB rating of all the movies in the database";

    function run($baseTimestamp) {
        global $e;
        $e->loadCoreModule("Database");
        $movies = new Movies;
        foreach ($movies as $movie)
            $movie->updateImdbRating();
    }
}
```

In the config property, we set the `executionPeriodicity` key to `JANITORTASK_EXECUTION_PERIODICITY_HOURS`, and the `periodicityHours` to `["00:00"]`. This will cause this task to run once at each one of the times specified in the `periodicityHours` array. In this case, at midnight precisely.

With `JANITORTASK_EXECUTION_PERIODICITY_HOURS`, you can specify more times for tasks to be executed more than once a day. For example, if you set `periodicityHours` to `["00:00", "12:00"]`, the task will be executed every day at midnight and at noon.

There are also other execution periodicities you can use:

* **`JANITORTASK_EXECUTION_PERIODICITY_EACH_SECONDS`** The task will be executed every specified seconds. Seconds are specified in `periodicityEachSeconds` config key.
* **`JANITORTASK_EXECUTION_PERIODICITY_MINUTES`** The task will be executed on the given minutes of each hour. Desired minutes are specified as an array in the `periodicityMinutes` config key. For example: `[0, 15, 30, 45]`
* **`JANITORTASK_EXECUTION_PERIODICITY_HOURS`** The task will be executed on the given hours of each day. Desired hours/minute are specified as an array in the `periodicityHours` config key in the syntax `["hour:minute", ...]` For example: `["00:00", "10:45", "20:15"]`
* **`JANITORTASK_EXECUTION_PERIODICITY_DAYSOFMONTH`** The task will be executed on the given days of each month. Desired days/hour/minute are specified as an array in the `periodicityDaysOfMonth` config key in the syntax `["day@hour:minute", ...]` For example: `["1@12:00", "15@18:30", "20@00:00"]`
* **`JANITORTASK_EXECUTION_PERIODICITY_ALWAYS`** The task will be executed every time Janitor run is called.
* **`JANITORTASK_EXECUTION_PERIODICITY_ONLY_MANUAL`** The task can only be executed when calling the Janitor run process with an specific task parameter.

In our task class, the `run` method is the one that will be executed when the task is due, so it's where you should put your task code. Like in our example, if you need to work with core or app modules there, use  [Engine::loadCoreModule](../reference/core-classes/engine/methods.md#loadcoremodule) or [Engine::loadAppModule](../reference/core-classes/engine/methods.md#loadappmodule).

