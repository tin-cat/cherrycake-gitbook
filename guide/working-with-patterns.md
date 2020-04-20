# Working with patterns



{% hint style="info" %}
You can change the directory where your patterns are stored by setting the `directory` key of the Patterns module configuration file.
{% endhint %}

Go to your browser and make a request to the `/test` path, you should get this:

```markup
Title
Subtitle
```

{% hint style="info" %}
If you get a 404 error when trying to test this module by accessing `/test`, you've most probably misconfigured your web server, check the [Setting up the web server](getting-started/#setting-up-the-web-server) section.
{% endhint %}

### Passing variables to a pattern

Now let's see how we can get the configuration values we set earlier in `Test.config.php` and put them in our HTML file.

We can get configuration values by using the [Module::getConfig](../reference/core-classes/module.md#getconfig-key) method of our module, and we can pass variables to be used inside a pattern via the `variables` setup key in the [Patterns::out](../reference/core-modules/patterns.md#out-patternname-setup-code) call, so here's how it will look:

