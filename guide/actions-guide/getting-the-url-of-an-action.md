# Getting the URL of an action

Whenever you need the URL of one of your own actions, say, to build a button in your web app that links to that action, you can just write it like this in your HTML pattern:

```markup
<a href="/about/contact">Contact</a>
```

But doing so, if you ever change your action parameters or path components, you'll be forced to change your links manually in all your patterns, one by one.

To avoid this, use the [Actions::getAction](../../reference/core-modules/actions-1/actions.md#getaction) method to get the action you want to get the URL of, and then use [Request::buildUrl ](../../reference/core-classes/request/request-methods.md#buildurl-setup)on the action's [$request ](../../reference/core-classes/action/properties.md#request)to retrieve it.

This is how it would look:

```php
$url = $e->Actions->getAction("aboutContact")->request->buildUrl();
```

You can do this directly in your HTML pattern:

```markup
<a href="<?= $e->Actions->getAction("aboutContact")->request->buildUrl() ?>">Contact</a>
```

Or you can pass the URL as a parameter to your pattern:



