# Passing variables to a pattern

We can pass variables to be used inside a pattern via the `variables` setup key in the [Patterns::out](../../reference/core-modules/patterns/methods.md#out) or the [Patterns::parse](../../reference/core-modules/patterns/methods.md#parse) call.

Imagine our `helloworld.html` file looks like this:

```markup
<!DOCTYPE html>
<html>
<body>
    <p>Here's a gift for you: 🧁</p>
</body>
</html>
```

But we want the gift emoji to be passed as a variable to the pattern to be able to pass a different one each time we make the call to [Patterns::out ](../../reference/core-modules/patterns/methods.md#out)or [Patterns::parse](../../reference/core-modules/patterns/methods.md#parse).

To do so, first we replace the emoji in the `helloworld.html` file with a PHP statement that simply echoes the variable `$emoji`, like this:

```markup
<!DOCTYPE html>
<html>
<body>
    <p>Here's a gift for you: <?= $emoji ?></p>
</body>
</html>
```

> Note that, to use PHP code inside a pattern, we need to enclose it in PHP's opening and closing tags: `<?php ... ?>`. In this case, however, we use the shorthand `<?= ... ?>` which is a shortcut for the more verbose `<?php echo ... ?>`

And now, in our call to[ Patterns::out](../../reference/core-modules/patterns/methods.md#out), we pass `emoji` as a variable:

```php
$e->Patterns->out("helloworld.html", [
    "variables" => [
        "emoji" => "🧸"
    ]
]);
```

So now, the browser shows this:

```markup
Here's a gift for you: 🧸
```

