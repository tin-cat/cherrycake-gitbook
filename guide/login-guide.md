---
description: >-
  The Login module provides a standardized method for implementing secure user
  identification workflows for web apps.
---

# Login guide

Using the [Login](../reference/core-modules/login.md) module, you're able to start implementing a secure password-based user authentication mechanism to your app.

Instead of implementing a complete user authentication workflow, the [Login](../reference/core-modules/login.md) module provides you a standardized method that you can adopt to create your authentication workflow, where things like the login form, the user database structure or the logout button are still up to you to implement to your liking.

Let's imagine we have in our database the following table called `users`, where we store all the users of our app, along with their login credentials:

| Field name | Specs |  |
| :--- | :--- | :--- |
| **`id`** | `unsigned` `int` `auto_increment` `primary key` | The unique id to identify users. |
| **`name`** | `varchar` | The name of the user. |
| **`email`** | `varchar` | The email of the user. |
| **`passwordHash`** | `varchar` | The hashed password. |

First thing to do is creating a class to represent a user in our app. This class must extend the `LoginUser` class, which in turn also extends the [Item](../reference/core-classes/item/) class just as we learned in the [Items guide](items-guide/), so it will be also the [Item](../reference/core-classes/item/) class that will represent an individual user in your app. Our `User` class will start looking like this:

```php
<?php

namespace CherrycakeApp;

class User extends \Cherrycake\LoginUser {
    protected $tableName = "users";
    
    protected $fields = [
        "id" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_INTEGER],
        "name" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_STRING],
        "email" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_STRING],
        "passwordHash" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_STRING]
    ];
}
```

For our `User` class to work properly with the [Login](../reference/core-modules/login.md) module, we need to add two properties:

* **`userNameFieldName`** The name of the field that holds the user name we want our users to identify with.
* **`encryptedPasswordFieldName`** The name of the field that holds the encrypted password of the users.

It would end looking like this:

```php
<?php

namespace CherrycakeApp;

class User extends \Cherrycake\LoginUser {
    protected $tableName = "users";
    protected $userNameFieldName = "email";
    protected $encryptedPasswordFieldName = "passwordHash";
    
    protected $fields = [
        "id" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_INTEGER],
        "name" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_STRING],
        "email" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_STRING],
        "passwordHash" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_STRING]
    ];
}
```

Now, to access the logged user and perform login/logout operations, you need to add the [Login](../reference/core-modules/login.md) module to the list of [core module dependencies](modules-guide.md#specifying-module-dependencies), in the modules where you'll be using it, like this:

```php
class HelloWorld extends \Cherrycake\Module {
    protected $dependentCoreModules = [
        "Login"
    ];

    ...    
}
```

