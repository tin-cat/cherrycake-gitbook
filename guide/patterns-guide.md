# Patterns guide

The simplest way of using [Patterns](../architecture/patterns.md) is just calling the [Patterns::out](../reference/core-modules/patterns/#out-patternname-setup-code) method to send a pattern to the browser:

```php
$e->Patterns->out("helloworld.html");
```

This will read the file `/patterns/pattern.html`, parse and output it to the client as the `payload` of an [ResponseTextHtml](../reference/core-classes/response/responsetexthtml.md) response.

> You can change the directory where your patterns are stored by setting the `directory` key of the Patterns module configuration file.

But this is just the most common way of using a pattern. You might need to simply get the results of a parsed pattern in a variable. For doing so, instead of using the [Patterns::out method](../reference/core-modules/patterns/#out-patternname-setup-code), you use [Patterns::parse](../reference/core-modules/patterns/#out-patternname-setup-code) like this:

```php
$parsedContents = $e->Patterns->parse("helloworld.html");
```

{% hint style="warning" %}
**Security warning**

Since patterns are parsed as PHP code, you're strongly advised against parsing files that are uploaded by the user or coming from untrusted sources.
{% endhint %}

## Passing variables to a pattern

We can pass variables to be used inside a pattern via the `variables` setup key in the [Patterns::out](../reference/core-modules/patterns/#out-patternname-setup-code) or the [Patterns::parse](../reference/core-modules/patterns/#parse-patternname-setup) call.

Imagine our `helloworld.html` file looks like this:

```markup
<!DOCTYPE html>
<html>
<body>
    <p>Here's a gift for you: 🧁</p>
</body>
</html>
```

But we want the gift emoji to be passed as a variable to the pattern to be able to pass a different one each time we make the call to [Patterns::out](../reference/core-modules/patterns/#out-patternname-setup-code) or [Patterns::parse](../reference/core-modules/patterns/#parse-patternname-setup).

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

And now, in our call to [Patterns::out](../reference/core-modules/patterns/#out-patternname-setup-code), we pass `emoji` as a variable:

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

## Nested patterns

One of the most powerful ideas behind template systems like [Patterns](../architecture/patterns.md) is the ability to include patterns within patterns, this opens many new ways of organizing and re-using your code.

Maybe the first idea that comes to mind is to put the header and the footer of your HTML document in two separate patterns because they're almost always the same in all the pages of your website. Let's do it.

Let's assume you save the header for your pages in a pattern called `header.html`, and it looks like this:

```markup
<!DOCTYPE html>
<html>
<body>
```

And your footer.html looks like this:

```markup
</body>
</html>
```

Then, you simply include those patterns in your main pattern. Because patterns have access to the Cherrycake engine, this is done by simply calling the [Patterns::parse](../reference/core-modules/patterns/#parse-patternname-setup) method you already know of, but this time inside your `helloworld.html` pattern:

```markup
<?= $e->Patterns->parse("header.html") ?>

    <p>Here's a gift for you: <?= $emoji ?></p>

<?= $e->Patterns->parse("footer.html") ?>
```

## Cached patterns

When a pattern is cached, its contents are read from the cache instead of the pattern file. Anything inside the pattern is cached, including any PHP code and nested patterns.

The main reason to cache a pattern is to avoid executing it every time it is used, specially if it contains instructions that are very resource demanding. While the pattern is in cache, it will be served instantly, no matter how long it took to parse it the first time it was used.

When combined with the ability to create structures of nested patterns, cached patterns can become a powerful tool to create high performance websites.

The main way to specify which patterns you want to cache is by adding them to the `cachedPatterns` key in the [Patterns configuration](../reference/core-modules/patterns/patterns-configuration.md) file, `/config/Patterns.config.php`, like this:

```php
<?php

namespace Cherrycake;

$PatternsConfig = [
    "cachedPatterns" => [
        "helloworld.html" => [
            "cacheTtl" => \Cherrycake\CACHE_TTL_1_MINUTE
        ]
    ]
];
```

This would cause the `helloworld.html` pattern to be parsed the first time it is used, and then stored in cache for one minute. During that minute, every other time the same pattern is used, the cached parsed result will be used instead. After one minute, the TTL will expire and the pattern will be parsed again on the next use. See [Working with Cache](cache-guide.md) for more details on this concepts.

