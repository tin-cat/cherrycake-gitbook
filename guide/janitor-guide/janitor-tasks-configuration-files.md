# Janitor tasks configuration files

You can optionally create Janitor tasks that hold some configuration in a separate configuration file, almost like [modules do](../modules-guide.md#modules-configuration-file).

To do so, set the `isConfigFile` property of your [JanitorTask](../../reference/core-classes/janitortask/) class like this:

```php
<?php

namespace CherrycakeApp;
    
class JanitorTaskMoviesUpdateImdbRating extends \Cherrycake\Janitor\JanitorTask {
    protected $isConfigFile = true;
    ...
}
```

Janitor task configuration files must be stored in the `config` directory of your app, and must have a name that matches the task name, even with upper and lowercase characters. For example, the configuration file for our `JanitorTaskMoviesUpdateImdbRating` task must be called `/config/JanitorTaskMoviesUpdateImdbRating.config.php`

Janitor task configuration files must declare a hash array named in the syntax `$<JanitorTaskName>Config`. For example, this the configuration file for our `JanitorTaskMoviesUpdateImdbRating` task:

```php
<?php

namespace Cherrycake;

$JanitorTaskMoviesUpdateImdbRatingConfig = [
    "imdbAPIKey" => "mfu9873n94hosdaonfo3289"
];
```

The values you set in the [JanitorTask::config](../../reference/core-classes/janitortask/janitortask-properties.md#config) property of your task class will be used if no configuration file is used, or if the configuration key has not been set in the configuration file.

To get a configuration value from a [JanitorTask](../../reference/core-classes/janitortask/), use the [JanitorTask::getConfig](../../reference/core-classes/janitortask/janitortask-methods.md#getconfig) method, for example:

```php
$this->getConfig("imdbAPIKey");
```

