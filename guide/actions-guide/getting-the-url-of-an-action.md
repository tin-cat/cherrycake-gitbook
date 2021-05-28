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

```php
$e->Patterns->out("page.html", [
    "variables" => [
        "urlAboutContact" => $e->Actions->getAction("aboutContact")->request->buildUrl()
    ]
]);
```

```markup
<a href="<?= $urlAboutContact ?>">Contact</a>
```

## Getting the URL of  actions with variable path components or GET parameters

When you want to get the URL of a more complex action that has some variable path components like `/product/4739`, or maybe accepts some GET parameters like `/user?userId=381`, you pass the `parameterValues` option key to [Request::buildUrl](../../reference/core-classes/request/request-methods.md#buildurl) with the values you need.

For example, for this action that has one fixed and one variable path component:

```php
$e->Actions->mapAction([
    "viewProduct",
    new \Cherrycake\Actions\ActionHtml([
        "moduleType" => ACTION_MODULE_TYPE_APP,
        "moduleName" => "Products",
        "methodName" => "view",
        "request" => new \Cherrycake\Actions\Request([
            "pathComponents" => [
                new \Cherrycake\Actions\RequestPathComponent([
                    "type" => REQUEST_PATH_COMPONENT_TYPE_FIXED,
                    "string" => "product"
                ]),
                new \Cherrycake\Actions\RequestPathComponent([
                    "type" => REQUEST_PATH_COMPONENT_TYPE_VARIABLE_NUMERIC,
                    "name" => "productId",
                    "securityRules" => [
                        SECURITY_RULE_NOT_EMPTY,
                        SECURITY_RULE_INTEGER,
                        SECURITY_RULE_POSITIVE
                    ]
                ])
            ]
        ])
    ])
]);
```

You would build a valid URL like this:

```php
echo $e->Actions->getAction("viewProduct")->request->buildUrl([
    "parameterValues" => [
        "productId" => 4739
    ]
]);
```

```text
/product/479
```

Now consider this more complex action that has one fixed path component and accepts accepts one GET parameter called `userId`:

```php
$e->Actions->mapAction([
    "viewUser",
    new \Cherrycake\Actions\ActionHtml([
        "moduleType" => ACTION_MODULE_TYPE_APP,
        "moduleName" => "Users",
        "methodName" => "view",
        "request" => new \Cherrycake\Actions\Request([
            "pathComponents" => [
                new \Cherrycake\Actions\RequestPathComponent([
                    "type" => REQUEST_PATH_COMPONENT_TYPE_FIXED,
                    "string" => "user"
                ])
            ],
            "parameters" => [
                new \Cherrycake\Actions\RequestParameter([
                    "type" => REQUEST_PARAMETER_TYPE_GET,
    						    "name" => "userId",
                    "securityRules" => [
                        SECURITY_RULE_TYPICAL_ID
                    ]
    						])
            ]
        ])
    ])
]);
```

You would build the URL for this action the same way, just specify the right parameter name:

```php
echo $e->Actions->getAction("viewUser")->request->buildUrl([
    "parameterValues" => [
        "userId" => 381
    ]
]);
```

```text
/user?userId=381
```

