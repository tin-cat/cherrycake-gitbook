# Janitor tasks configuration files

You can optionally create Janitor tasks that hold some configuration in a separate configuration file, almost like [modules do](../modules-guide.md#modules-configuration-file).

To do so, set the `isConfigFile` property of your [JanitorTask](../../reference/core-classes/janitortask/) class like this:

```php
<?php

namespace CherrycakeApp;
    
class JanitorTaskMoviesUpdateImdbRating extends \Cherrycake\JanitorTask {
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
    "ImdbAPIKey" => "mfu9873n94hosdaonfo3289"
];
```

