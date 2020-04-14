---
description: >-
  Understanding the lifecycle of a request in Cherrycake will give you valuable
  insight on how it works.
---

# Lifecycle

We'll first go through a simplified version of the lifecycle of a request, assuming we're building a website application and our client is a web browser.

When a Cherrycake application receives a request, first it loads some initial modules like [Output](../../reference/core-modules/output/), [Errors](../../reference/core-modules/errors.md) and [Actions](../../reference/core-modules/actions/). These are the modules that Cherrycake needs to determine what to do next:

![](../../.gitbook/assets/cherrycakediagramlifecycle1.svg)

Cherrycake now asks the [Actions](../../reference/core-modules/actions/) module to attend the received request:

![](../../.gitbook/assets/cherrycakediagramlifecycle2.svg)

To do so, [Actions](../../reference/core-modules/actions/) checks the requested route to see which modules have mapped an action. If it founds a matching mapped action, loads and runs the module who mapped it.

Let's say the browser requested the home of our website by requesting the `/` route, and that this route has been mapped by a module we called _Home_. Cherrycake loads this module and runs it:

![](../../.gitbook/assets/cherrycakediagramlifecycle3.svg)

_Home_ is not a core module, but a module the developer has created, and it's in charge of showing the home page of the website. To do so, _Home_ uses the [Patterns](../../reference/core-modules/patterns/) module to load an HTML file from disk and then send it to the browser. Since the Patterns module has not been loaded yet, Cherrycake loads it automatically:

![](../../.gitbook/assets/cherrycakediagramlifecycle4.svg)

Since all output is handled by the [Output](../../reference/core-modules/output/) module, [Patterns](../../reference/core-modules/patterns/) uses it to finally send back the response to the Browser, in our example, in the form of an __HTTP success response containing the home HTML document, and the request lifecycle concludes.

![](../../.gitbook/assets/cherrycakediagramlifecycle5.svg)

