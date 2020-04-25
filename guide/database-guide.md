---
description: >-
  The Database module provides your Cherrycake application with a standardized
  interface to connect to database servers like MySQL and MariaDB.
---

# Database guide

## Database providers

To connect to database servers you must configure a database provider. Just like with the [Cache](cache-guide.md) module, you can configure multiple providers to connect to multiple databases at the same time.

> Cherrycake is currently only compatible with MySQL and MariaDB servers.

Database providers are configured in the [Database configuration]() file `Database.config.php`.For example, if you want to connect to a MySQL database server, your Cache configuration file would look like this:

```php
<?php

namespace Cherrycake;

$CacheConfig = [
    "providers" => [
        "main" => [
            "providerClassName" => "DatabaseProviderMysql",
            "config" => [
                "host" => "localhost",
                "user" => "user",
                "password" => "password",
                "database" => "cherrycake",
                "charset" => "utf8mb4",
                "cacheProviderName" => "engine"
            ]
        ]
    ]
];
```

> Note we called our database provider `main`

## Using the database

Just like Cache, some other modules use Database for many purposes, for example: The [Session](session-guide.md) module uses a database connection to store information about sessions.

> That's why in the [Cherrycake Skeleton](getting-started/skeleton.md) boilerplate you'll find the `/install` directory containing some SQL scripts to setup the needed tables to work with all the core Cherrycake modules.

Of course you can access the database too in your app, and here's how it's done.

