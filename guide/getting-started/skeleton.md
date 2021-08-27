---
description: >-
  Start a Cherrycake app using the pre-built skeleton, a simple "Hello world"
  web app ready to run.
---

# Skeleton start

The Cherrycake Skeleton is a [GitHub repository](https://github.com/tin-cat/cherrycake-skeleton) you can download or clone that leaves you with a boilerplate Cherrycake application ready to run and to be modified.

Instead of creating the files and directories you need each time you create a new Cherrycake application, you download a [Cherrycake skeleton](https://github.com/tin-cat/cherrycake-skeleton) and start working straightaway.

> The Cherrycake Skeleton additionally provides you with other useful files, like the SQL scripts to setup the database tables needed by some Cherrycake core modules or the `cli.php` file you'll need to run [CLI applications](../cli.md).

## Starting an app with a Cherrycake Skeleton

First, clone or [download](https://github.com/tin-cat/cherrycake-skeleton) the Cherrycake Skeleton:

```bash
git clone https://github.com/tin-cat/cherrycake-skeleton CherrycakeApp
```

Now download the dependencies with composer:

```php
composer install
```

Follow the [Setting up the web server](./#setting-up-the-web-server) section of the documentation and you should be ready to go!

