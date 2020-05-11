# Login methods

## doLogin\( userName, password \) <a id="dologin"></a>

Checks the given credentials in the database, and logs in the user if they're found to be correct.

* **`userName`** The string field that uniquely identifies the user on the database, the one used by the user to login. Usually, an email or a username.
* **`password`** The password entered by the user to login.

**Returns:** One of the available [`LOGIN_RESULT_?`](./#constants) constants signifying the result of the login operation.

## encryptPassword\( password \) <a id="encryptpassword"></a>

Encrypts the given password with the configured password encryption method.

* **`password`** The password to encrypt

**Returns:** The encrypted string, or false if the password could not be encrypted

## isLogged

Checks whether there is a logged user or not.

**Returns:** True if the current user is logged or false if it's not.

## logoutUser

Logs out the current user.

**Returns:** One of the available [`LOGOUT_RESULT_?`](./#constants) constants signifying the result of the logout operation.

