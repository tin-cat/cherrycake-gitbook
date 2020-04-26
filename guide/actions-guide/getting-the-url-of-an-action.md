# Getting the URL of an action

Whenever you need the URL of one of your own actions, say, to build a button in your web app that links to that action, you can just write it like this in your pattern:

```markup
<a href="/about/contact">Contact</a>
```

But doing so will force you to change your links manually one by one if you ever change your action. To avoid this, use the Action::

