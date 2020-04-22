# Working with Patterns

Because [Patterns](../reference/core-modules/patterns.md) is actually a core module, you can use any other template parser you like in your Cherrycake app, build your own or get rid of any template mechanism if you like.

{% hint style="info" %}
You can change the directory where your patterns are stored by setting the `directory` key of the Patterns module configuration file.
{% endhint %}

### Passing variables to a pattern

Now let's see how we can get the configuration values we set earlier in `Test.config.php` and put them in our HTML file.

We can get configuration values by using the [Module::getConfig](../reference/core-classes/module.md#getconfig-key) method of our module, and we can pass variables to be used inside a pattern via the `variables` setup key in the [Patterns::out](../reference/core-modules/patterns.md#out-patternname-setup-code) call, so here's how it will look:

{% hint style="warning" %}
**Security warning**

Since patterns are parsed as PHP code, you're strongly advised against parsing files that are uploaded by the user or coming from untrusted sources with the [Patterns::parse](../reference/core-modules/patterns.md#parse-patternname-setup) method.
{% endhint %}



