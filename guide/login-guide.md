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

First thing to do is creating a class to represent a user in our app. This class must extend the [Item](../reference/core-classes/item/) class just as we learned in the [Items guide](items-guide/), and it must also implement the `LoginUser` interface. Our User class will end looking like this:



