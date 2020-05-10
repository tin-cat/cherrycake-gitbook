---
description: >-
  The Login module provides a standardized method for implementing secure user
  identification workflows for web apps.
---

# Login

> See the [Login guide](../../guide/login-guide/) to learn how to work with the Login module.

## Configuration

* **`userClassName`** The name of the app class that represents a user on the App. Must implement the `\Cherrycake\LoginUser` interface.
* **`passwordAuthenticationMethod`** One of the available `LOGIN_PASSWORD_ENCRYPTION_METHOD_?`constants for password authentication methods. Default:`LOGIN_PASSWORD_ENCRYPTION_METHOD_PBKDF2`
* **`isLoadUserOnInit`** Whether to check for a logged user and get it on this module's init sequence. Default: `true`
* **`sleepOnErrorSeconds`** Seconds to delay execution when a wrong login is requested, to make things difficult for bombing attacks. Default: `1`

