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

To use the [Login](../reference/core-modules/login.md) module, you'll need to add it to the list of your core [module dependencies](modules-guide.md#specifying-module-dependencies) in the modules where you'll be using it, like this:

```php
class HelloWorld extends \Cherrycake\Module {
    protected $dependentCoreModules = [
        "Login"
    ];

    ...    
}
```

Next thing to do is creating a class to represent a user in our app. This class must extend the [Item](../reference/core-classes/item/) class just as we learned in the [Items guide](items-guide/), and it must also implement the `LoginUser` interface. Our `User` class will start looking like this:

```php
<?php

namespace CherrycakeApp;

class User extends \Cherrycake\Item implements \Cherrycake\LoginUser {
    protected $tableName = "users";
    
    protected $fields = [
        "id" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_INTEGER],
        "name" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_STRING],
        "email" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_STRING],
        "passwordHash" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_STRING]
    ];
}
```

But for our User class to work properly with the Login module, we need to implement at least the interfaced methods `loadFromUserNameField` and `getEncryptedPassword`.

Implementing the required `loadFromUserNameField` method is easy. Since we want the email to be the username when login in our application, we can use the Item::loadFromId method, like this:

```php
<?php

namespace CherrycakeApp;

class User extends \Cherrycake\Item implements \Cherrycake\LoginUser {
    protected $tableName = "users";
    
    protected $fields = [
        "id" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_INTEGER],
        "name" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_STRING],
        "email" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_STRING],
        "passwordHash" => ["type" => \Cherrycake\DATABASE_FIELD_TYPE_STRING]
    ];
    
    function loadFromUserNameField($userName) {
        return $this->loadFromId($userName, "email");
    }
}
```



