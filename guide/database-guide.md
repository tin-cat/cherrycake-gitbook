---
description: >-
  The Database module provides your Cherrycake application with a standardized
  interface to connect to database servers like MySQL and MariaDB.
---

# Database guide

## Database providers

To connect to database servers you must configure a database provider. Just like with the [Cache](cache-guide.md) module, you can configure multiple providers to connect to multiple databases at the same time.

> Cherrycake is currently only compatible with MySQL and MariaDB servers.

Database providers are configured in the [Database configuration](../reference/core-modules/database/database-configuration.md) file `Database.config.php`.For example, if you want to connect to a MySQL database server, your Cache configuration file would look like this:

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

> Note we called our cache provider `fast`

