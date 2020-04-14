---
description: >-
  Understanding the lifecycle of a request in Cherrycake will give you valuable
  insight on how it works.
---

# Lifecycle

We'll go through a simplified version of the lifecycle of a request, assuming we're building a web site and our client is actually a web browser.

When a Cherrycake application receives a request, first thing he does is load some initial modules like [Output](../../reference/core-modules/output.md), [Errors](../../reference/core-modules/errors.md) and [Actions](../../reference/core-modules/actions.md). These are the modules that Cherrycake will use to determine what to do next:

![](../../.gitbook/assets/cherrycakediagramlifecycle1.svg)

Cherrycake now asks the [Actions](../../reference/core-modules/actions.md) module to attend the received request:

![](../../.gitbook/assets/cherrycakediagramlifecycle2.svg)

To do so, [Actions](../../reference/core-modules/actions.md) checks the requested route to see which modules have mapped it. If a module is found to have mapped the requested route, loads and runs it.

{% hint style="info" %}
Check out the [Cached actions map ](cached-actions-map.md)section to learn how does Cherrycake knows which module has mapped the requested route without loading them all.
{% endhint %}

Let's say the browser requested the home of our website by requesting the `/` route, and that this route has been configured by the module we called _Home:_

![](../../.gitbook/assets/cherrycakediagramlifecycle3.svg)

_Home_ is not a core module, but a module the developer has created, and it's in charge of showing the home page of the website. To do so, _Home_ uses the [Patterns](../../reference/core-modules/patterns.md) module to load an HTML file from disk and then send it to the browser. Since the Patterns module has not been loaded yet, Cherrycake loads it automatically:

![](../../.gitbook/assets/cherrycakediagramlifecycle4.svg)

Since all output is handled by the [Output](../../reference/core-modules/output.md) module, [Patterns](../../reference/core-modules/patterns.md) _uses_ it to finally send back the response to the Browser, in our example, in the form of an __HTTP success response containing the home HTML document:

![](../../.gitbook/assets/cherrycakediagramlifecycle5.svg)

