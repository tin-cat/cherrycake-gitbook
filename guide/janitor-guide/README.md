---
description: The Janitor module allows an app to program tasks to be executed periodically.
---

# Janitor guide

In many cases you'll need some sort of mechanism to automatically execute tasks with certain periodicity, at certain times of the day, every few days or every few minutes. The [Janitor](../../reference/core-modules/janitor/) module is designed to do exactly that.

Some examples of the kind of tasks you might want to automate with [Janitor](../../reference/core-modules/janitor/) are:

* Maintenance tasks, like optimizing a database periodically.
* Batch processes, like gathering all the invoices at the end of the day to generate daily reports.
* Database purges, like removing old data from a database to avoid cluttering it.
* Cache flushes, like periodically clearing certain cached data.
* Buffer commits, like committing data stored in a shared memory buffer to a database for persistence.

## Setting up the Janitor database table

Janitor uses the `cherrycake_janitor_log` database table to store information about the executed tasks.

> You can create the Janitor table in your database by importing the `janitor.sql` file you'll find in the [Cherrycake skeleton repository](https://github.com/tin-cat/cherrycake-skeleton), under the `install/database` directory.

## Janitor tasks

To set up a task to be executed by the [Janitor](../../reference/core-modules/janitor/) module, you first create a new class that extends the [JanitorTask](../../reference/core-classes/janitortask/) core class.

Imagine we wanted to create a task to update the IMDB rating of the movies in the database every day. To do so, we would create the file `src/JanitorTaskMoviesUpdateImdbRating.class.php` like this:

```php
<?php

namespace CherrycakeApp;
    
class JanitorTaskMoviesUpdateImdbRating extends \Cherrycake\Janitor\JanitorTask {
    protected $name = "Movies update IMDB rating";
    protected $description = "Updates the IMDB rating of all the movies in the database";
    
    protected $config = [
    		"executionPeriodicity" => \Cherrycake\Janitor\JANITORTASK_EXECUTION_PERIODICITY_HOURS,
		    "periodicityHours" => ["00:00"]
    ];

    function run($baseTimestamp) {
        global $e;
        $e->loadCoreModule("Database");
        
        $movies = new Movies(["fillMethod" => "fromParameters"]);
        foreach ($movies as $movie)
            $movie->updateImdbRating();
        
        return [
    			\Cherrycake\Janitor\JANITORTASK_EXECUTION_RETURN_OK,
		    	$movies->count()." movies updated"
        ];
    }
}
```

In the config property, we set the `executionPeriodicity` key to [`JANITORTASK_EXECUTION_PERIODICITY_HOURS`](../../reference/core-modules/janitor/#constants), and the `periodicityHours` to `["00:00"]`. This will cause this task to run once at each one of the times specified in the `periodicityHours` array. In this case, at midnight precisely.

With [`JANITORTASK_EXECUTION_PERIODICITY_HOURS`](../../reference/core-modules/janitor/#constants), you can specify more times for tasks to be executed more than once a day. For example, if you set `periodicityHours` to `["00:00", "12:00"]`, the task will be executed every day at midnight and at noon.

There are also other execution periodicities you can use:

* **`JANITORTASK_EXECUTION_PERIODICITY_EACH_SECONDS`** The task will be executed every specified seconds. Seconds are specified in `periodicityEachSeconds` config key.
* **`JANITORTASK_EXECUTION_PERIODICITY_MINUTES`** The task will be executed on the given minutes of each hour. Desired minutes are specified as an array in the `periodicityMinutes` config key. For example: `[0, 15, 30, 45]`
* **`JANITORTASK_EXECUTION_PERIODICITY_HOURS`** The task will be executed on the given hours of each day. Desired hours/minute are specified as an array in the `periodicityHours` config key in the syntax `["hour:minute", ...]` For example: `["00:00", "10:45", "20:15"]`
* **`JANITORTASK_EXECUTION_PERIODICITY_DAYSOFMONTH`** The task will be executed on the given days of each month. Desired days/hour/minute are specified as an array in the `periodicityDaysOfMonth` config key in the syntax `["day@hour:minute", ...]` For example: `["1@12:00", "15@18:30", "20@00:00"]`
* **`JANITORTASK_EXECUTION_PERIODICITY_ALWAYS`** The task will be executed every time Janitor run is called.
* **`JANITORTASK_EXECUTION_PERIODICITY_ONLY_MANUAL`** The task can only be executed when calling the Janitor run process with an specific task parameter.

In our task class, the `run` method is the one that will be executed when the task is due, so it's where you should put your task code. Like in our example, if you need to work with core or app modules there, use  [Engine::loadCoreModule](../../reference/core-classes/engine/methods.md#loadcoremodule) or [Engine::loadAppModule](../../reference/core-classes/engine/methods.md#loadappmodule).

Just like you see on the example above, the `run` method must return an array containing at least one element, being one of the available [`JANITORTASK_EXECUTION_RETURN_?`](../../reference/core-modules/janitor/#constants) constants. You can add a second element containing a description of the task execution result.

## Adding Janitor tasks to be executed

The last step to having your Janitor tasks automatically executed, is creating the `config/Janitor.config.php` file and  adding them to the [`appJanitorTasks`](../../reference/core-modules/janitor/#configuration) configuration key.

In our example, the `config/Janitor.config.php` would look like this:

```php
<?php

namespace Cherrycake;

$JanitorConfig = [
	"appJanitorTasks" => [
		"JanitorTaskMoviesUpdateImdbRating"
	]
];
```

## Cherrycake core Janitor tasks

Cherrycake itself sets up by default the following core Janitor tasks:

* **`JanitorTaskJanitorPurge`** Performs maintenance tasks related to the [Janitor](../../reference/core-modules/janitor/) module itself, like purging old log items from the database.
* **`JanitorTaskSystemLogPurge`** Performs maintenance tasks related to the [SystemLog](../../reference/core-modules/systemlog.md) module, like purging old log items from the database.
* **`JanitorTaskSystemLogCommit`** Commits the [SystemLog](../../reference/core-modules/systemlog.md) events stored in the cache shared memory to the database for persistence and for optimal performance.
* **`JanitorTaskSessionPurge`** Performs maintenance tasks related to the [Session](../../reference/core-modules/session/) module, like purging old sessions.
* **`JanitorTaskStatsCommit`** Commits the [Stats](../../reference/core-modules/stats/) events stored in the cache shared memory to the database for persistence and for optimal performance.
* **`JanitorTaskLogCommit`** Commits the [Log](../../reference/core-modules/log/) events stored in the cache shared memory to the database for persistence and for optimal performance.

## Setting up the Janitor cron job

To let [Janitor](../../reference/core-modules/janitor/) do its job, the [CLI action](../cli.md#cli-actions) named `janitorRun` must be executed every minute automatically by the operating system in the server. This is usually done by setting up a cron job in Linux that does it by using the Cherrycake [Command line interface](../cli.md).

In Linux, you would set up the Janitor cron job by editing your crontab with the command:

```bash
crontab -e
```

And adding a line like this:

```text
* * * * * /var/www/app/cherrycake janitorRun
```

If you've not used the [Cherrycake Skeleton](../getting-started/skeleton.md) to build your project, take a look at the [Command line interface](../cli.md) section to learn how to call CLI actions from the Linux command line.

> When using the [Cherrycake Docker project](../getting-started/docker.md) to run your Cherrycake app, this cron job is already set up and running.

## Checking the status of the Janitor

The Janitor logs all its activity on the `cherrycake_janitor_log`, so you can check there to see what's happening in real time.

You can also execute the `janitorStatus` [CLI command](../cli.md), which will show you the current status of all the tasks in your app, plus information about the last time they were executed. It looks like this:

```text
Task: Janitor purge
Description: Purges old Janitor log items
Result: Ok
Periodicity: Every 86400 seconds
Last execution: 26/5/2020 15:10:59 (Etc/UTC) took 0 ms.
. Log entries older than 31536000 seconds purged: 0

Task: Log commit
Description: Stores cache-queded events into database and purges the queue cache
Result: Ok
Periodicity: Every 60 seconds
Last execution: 26/5/2020 15:12:01 (Etc/UTC) took 0 ms.
. 
Task: Session purge
Description: Purges discarded sessions from the Session module
Result: Ok
Periodicity: Every 86400 seconds
Last execution: 26/5/2020 15:10:59 (Etc/UTC) took 2 ms.
. Sessions older than 86400 seconds without data purged: 0
. Sessions older than 31536000 seconds with data purged: 0

Task: Stats commit
Description: Stores cache-queded stats events into database and purges the queue cache
Result: Ok
Periodicity: Every 60 seconds
Last execution: 26/5/2020 15:12:01 (Etc/UTC) took 1 ms.
. numberOfFlushedItems: 0

Task: System log commit
Description: Stores cache-queded system log events into database and purges the queue cache
Result: Ok
Periodicity: Every 120 seconds
Last execution: 26/5/2020 15:10:59 (Etc/UTC) took 1 ms.
. numberOfFlushedItems: 0

Task: System log purge
Description: Purges old System log items
Result: Ok
Periodicity: Every 240 seconds
Last execution: 26/5/2020 15:10:59 (Etc/UTC) took 1 ms.
. Log entries older than  seconds purged: 0

Task: Movies update IMDB rating
Description: Updates the IMDB rating of all the movies in the database
Result: Ok
Periodicity: Daily at hours 00:00
Last execution: 26/5/2020 15:10:59 (Etc/UTC) took 13 ms.
. 30 movies updated
```

