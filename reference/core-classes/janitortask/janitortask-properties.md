# JanitorTask properties

## $config <a id="config"></a>

Holds the default configuration for this JanitorTask, intended to be overloaded by specific task objects, with the following available keys:

* **`executionPeriodicity`** The periodicity for this task execution. One of the available [`JANITORTASKEXECUTION_PERIODICITY_?`](../../core-modules/janitor/#constants) constants.
* **`periodicityEachSeconds`** When `executionPeriodicity` is set to J`ANITORTASK_EXECUTION_PERIODICITY_EACH_SECONDS`, this is the number of seconds between each execution.
* **`periodicityMinutes`** When `executionPeriodicity` is set to `JANITORTASK_EXECUTION_PERIODICITY_MINUTES`, this is an array specifying the minutes within each hour when this task will be executed, in the syntax: `[0, 15, 30, 45, ...]`
* **`periodicityHours`** When `executionPeriodicity` is set to `JANITORTASK_EXECUTION_PERIODICITY_HOURS`, this is an array specifying the hours and minutes within each day when this task will be executed, in the syntax: `["hour:minute", "hour:minute", "hour:minute", ...]`
* **`periodicityDaysOfMonth`** When `executionPeriodicity` is set to `JANITORTASK_EXECUTION_PERIODICITY_DAYSOFMONTH`, this is an array specifying the days, hours and minutes within each month this task will be executed, in the syntax: `["day@hour:minute", "day@hour:minute", "day@hour:minute", ...]`

## $isConfigFile <a id="isconfigfile"></a>

Whether this JanitorTask has its own configuration file. Intended to be overloaded by specific tasks.

**Default:** false

## $name <a id="name"></a>

The name of the task. Intended to be overloaded by specific tasks.

## $description <a id="description"></a>

The description of the task. Intended to be overloaded by specific tasks.

