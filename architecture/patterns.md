---
description: >-
  Cherrycake provides a patterns parser that uses PHP code to integrate your
  code seamlessly with your template files, providing advanced Cherrycake
  capabilities to your template structures.
---

# Patterns

When working in conjunction with Cherrycake, [Patterns](../reference/core-modules/patterns.md) becomes a powerful template parser that not only allows you to use templates for your HTML files, but also for your Css, JavaScript and any other kinds of files where you might need template-like capabilities.

These are the most interesting capabilities [Patterns](../reference/core-modules/patterns.md) brings to your app:

* Lets your HTML, CSS and JavaScript code reside in patterns outside your PHP.
* Because you can unlimitedly nest patterns, you can create neat pattern structures for re-usability.
* Patterns can receive variables, making for an interesting way of reusing HTML code as objectified fragments, and other similar applications.
* Pattern files can get access to the entire Cherrycake engine, so you can use Cherrycake PHP code in your patterns.
* No need to learn a pattern language, just use PHP. Conditional statements, loops and any other PHP code will work in a pattern.
* [Patterns](patterns.md) works with the [Cache](../reference/core-modules/cache.md) module to provide a pattern-level cache, meaning that individual patterns can be cached as you like to improve performance. Because patterns can be nested, you can cache only the patterns that contain static or almost static information, and let only patterns with dynamic information be parsed each time they're used.
* The [Css](../reference/core-modules/css.md) and [JavaScript](../reference/core-modules/javascript.md) modules work with Patterns too, bringing all this capabilities also to your Css and JavaScript files.

Because [Patterns](../reference/core-modules/patterns.md) is actually a Cherrycake core module, you can use any other template parser you like in your Cherrycake app, build your own or get rid of any template mechanism if you like.

> See [Working with Patterns](../guide/patterns-guide.md) for a guide on how to use this module.

