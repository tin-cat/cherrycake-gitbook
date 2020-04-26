---
description: >-
  Patterns provides your HTML, CSS, JavaScript and other types of files with a
  dynamic template mechanism that brings performance, re-usability and code
  tidiness benefits.
---

# Patterns guide

The simplest way of using [Patterns](../../architecture/patterns.md) is just calling the [Patterns::out](../../reference/core-modules/patterns/#out-patternname-setup-code) method to send a pattern to the browser:

```php
$e->Patterns->out("helloworld.html");
```

This will read the file `/patterns/pattern.html`, parse and output it to the client as the `payload` of an [ResponseTextHtml ](../../reference/core-classes/response.md)response.

> You can change the directory where your patterns are stored by setting the `directory` key of the Patterns module configuration file.

But this is just the most common way of using a pattern. You might need to simply get the results of a parsed pattern in a variable. For doing so, instead of using the [Patterns::out](../../reference/core-modules/patterns/methods.md#out) method, you use [Patterns::parse](../../reference/core-modules/patterns/methods.md#parse) like this:

```php
$parsedContents = $e->Patterns->parse("helloworld.html");
```

{% hint style="warning" %}
**Security warning**

Since patterns are parsed as PHP code, you're strongly advised against parsing files that are uploaded by the user or coming from untrusted sources.
{% endhint %}

