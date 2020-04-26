# Brute force attacks

Dictionary attacks and other kinds of brute force attacks often rely on the ability to send lots of requests per second in order to, for example, try different passwords to hack an account. In those cases, the faster our server responds, the easier is for the attacker to try many passwords per second.

One way of making it difficult for the attackers is to add an intentional delay to the response, so the amount of time needed to try a reasonable amount of passwords rises quickly, hopefully discouraging the attacker.

By setting the `isSensibleToBruteForceAttacks` setup key to true when creating the [Action](../../reference/core-classes/action/methods.md#__construct-setup) object, Cherrycake will take care of adding this delay to the request.

The delay is only added when the method called by the action returns `false`. Be sure to return `false` in methods mapped as actions when the sensible task was unsuccessful. For example: If a received  password or key of any kind was checked against a database or any kind of authentication method, and it failed.

> A random delay is used to emulate an unstable connection for added stealthiness. This can be adjusted by setting the `sleepSecondsWhenActionSensibleToBruteForceAttacksFails` configuration key of the [Actions](../../reference/core-modules/actions-1/) module.

