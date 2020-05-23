# JanitorTask methods

## getConfig\( key \) <a id="getconfig"></a>

Gets a configuration value.

* **`key`** The configuration key

**Returns:** The configuration value.

## init

Initializes the JanitorTask, called automatically when the JanitorTask is loaded. Contains any specific initialization for the task. Intended to be overloaded by specific tasks when needed.

**Returns:** A boolean specifying whether the JanitorTask was initialized ok or failed.

## run\( baseTimestamp \)

Performs the tasks for what this JanitorTask is meant. Must be overloaded by a higher level JanitorTask class.

* **`baseTimestamp`** The base timestamp to use for time-based calculations when running this task. Usually, now.

**Returns:** An array with the following values:

* One of the [`JANITORTASK_EXECUTION_RETURN_?`](../../core-modules/janitor/#constants) available constants indicating the result of the task execution.
* The description of the task result, or a hash array of information on the result of the task execution.

