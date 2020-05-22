---
description: Allows an app to program tasks to be executed automatically and periodically.
---

# Janitor

> See the [Janitor guide](../../guide/janitor-guide.md) to learn how to work with the Janitor module.

## Constants

* **`JANITORTASK_EXECUTION_RETURN_WARNING`** Return code for [JanitorTask](../core-classes/janitortask.md) run when task returned a warning.
* **`JANITORTASK_EXECUTION_RETURN_ERROR`** Return code for [JanitorTask](../core-classes/janitortask.md) run when task returned an error.
* **`JANITORTASK_EXECUTION_RETURN_CRITICAL`** Return code for [JanitorTask](../core-classes/janitortask.md) run when task returned a critical error.
* **`JANITORTASK_EXECUTION_RETURN_OK`** Return code for [JanitorTask](../core-classes/janitortask.md) run when task was executed without errors.



* **`JANITORTASK_EXECUTION_PERIODICITY_ONLY_MANUAL`** The task can only be executed when calling the Janitor run process with an specific task parameter. It won't be executed on regular "all-tasks" calls to Janitor.
* **`JANITORTASK_EXECUTION_PERIODICITY_ALWAYS`** The task must be executed every time Janitor run is called.
* **`JANITORTASK_EXECUTION_PERIODICITY_EACH_SECONDS`** The task must be executed every specified seconds. Seconds specified in `periodicityEachSeconds` config key.
* **`JANITORTASK_EXECUTION_PERIODICITY_MINUTES`** The task must be executed on the given minutes of each hour. Desired minutes are specified as an array in the `periodicityMinutes` config key with the syntax: `[0, 15, 30, 45]`
* **`JANITORTASK_EXECUTION_PERIODICITY_HOURS`** The task must be executed on the given hours of each day. Desired hours/minute are specified as an array in the `periodicityHours` config key with the syntax: `["hour:minute", "hour:minute", "hour:minute"]`
* **`JANITORTASK_EXECUTION_PERIODICITY_DAYSOFMONTH`** The task must be executed on the given days of each month. Desired days/hour/minute are specified as an array in the `periodicityDaysOfMonth` config key with the syntax: `["day@hour:minute", "day@hour:minute", "day@hour:minute"]` \(Take into account days of month that do not exist\)



