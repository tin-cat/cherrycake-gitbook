# HtmlDocument guide

When you're using Cherrycake to build a web app, the [HtmlDocument](../reference/core-modules/htmldocument/) module helps you create standard HTML structure headers and footers with some additional useful capabilities.

The two most important methods of the [HtmlDocument](../reference/core-modules/htmldocument/) module are [HtmlDocument::header](../reference/core-modules/htmldocument/htmldocument-methods.md#header) and [HtmlDocument::footer](../reference/core-modules/htmldocument/htmldocument-methods.md#footer), they both take care of building the usual `<html><body> ...` and `...</body></html>` tags. For example, take this code that outputs a simple HTML response to show a webpage:

```php
$e->Output->setResponse(new \Cherrycake\ResponseTextHtml([
    "code" => \Cherrycake\RESPONSE_OK,
    "payload" =>
        $e->HtmlDocument->header().
        "Hello world!".
        $e->HtmlDocument->footer()
]));
```

This would open the following HTML code:

```markup
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="robots" content="index,follow" />
<link rel="stylesheet" type="text/css" href="/css?set=coreUiComponents:718d83f2e5ae92b539f90f7dc7e3ba24" />
<script type="text/javascript" src="/js?set=coreUiComponents:d41d8cd98f00b204e9800998ecf8427e"></script>
<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1, maximum-scale=2" />
</head>
<body>
Hello world!</body>
</html>
```

Take a look at the[ configuration of the HtmlDocument](../reference/core-modules/htmldocument/), where you can configure the title of your page, description, keywords, and many other important aspects of your HTML document structure.

> See how HtmlDocument also took care of including a CSS stylesheet and a JavaScript script automatically. This will come in handy when you start using the [CSS and Javascript modules](css-and-javascript-guide.md).



