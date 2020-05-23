# Janitor methods

## run\( request \) <a id="run"></a>

Determines which tasks need to be executed now and executes them. If a task name is passed via [Request](../../core-classes/request/) in the `task` parameter, only that task will be executed, if due to be executed. If, additionally, the `isForceRun` parameter is passed as `true`, the task name will be executed even if it's not due to be executed.

* **`request`** A [Request](../../core-classes/request/) object, passed by the [Actions](../actions-1/) module when calling this method as the result of an action.

