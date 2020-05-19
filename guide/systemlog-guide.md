# SystemLog guide

The [SystemLog](../reference/core-modules/systemlog/) module stores a log events as they occur, aimed at monitoring failures, warnings and other issues that might happen during the execution of the app.

Many core modules use [SystemLog](../reference/core-modules/systemlog/) when available to store logs of events. For example:

* The [Errors](../reference/core-modules/errors.md) module logs the triggered errors as events with the class [SystemLogEventError](../reference/core-classes/systemlogevent/#subclasses).
* The [Security](../reference/core-modules/security/) module logs security related issues as events with the class [SystemLogEventHack](../reference/core-classes/systemlogevent/#subclasses).
* The [Validate](../reference/core-modules/validate.md) module logs errors found when using external APIs to validate email addresses, as events with the class [SystemLogEventError](../reference/core-classes/systemlogevent/#subclasses).

