# Nested patterns

One of the most powerful ideas behind template systems like [Patterns](../../architecture/patterns/) is the ability to include patterns within patterns, this opens many new ways of organizing and re-using your code.

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

Then, you simply include those patterns in your main pattern. Because patterns have access to the Cherrycake engine, this is done by simply calling the [Patterns::parse ](../../reference/core-modules/patterns/methods.md#parse)method you already know of, but this time inside your pattern:

```markup
<?= $e->Patterns->parse("header.html") ?>

    <p>Here's a gift for you: <?= $emoji ?></p>

<?= $e->Patterns->parse("footer.html") ?>
```

> This example is implemented in the [Cherrycake documentation examples repository](https://github.com/tin-cat/cherrycake-documentation-examples), in the `PatternsGuide` module, and runs by requesting the URL `/patterns-guide/nested-patterns`

