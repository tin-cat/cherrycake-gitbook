# Complex actions

In the previous example, the `pathComponents` is left to false because we wanted the action to respond to requests to the root `/` page. To map actions that respond to more complex routes like `/about/contact`, we use `pathComponents` to pass an array of [RequestPathComponent](../../reference/core-classes/requestpathcomponent/) objects representing the segments of the path.

In this example, we map an action that will respond when the `/about/contact` path is requested:

```php
...

$e->Actions->mapAction([
    "aboutContact",
    new \Cherrycake\ActionsActionHtml([
        "moduleType" => ACTION_MODULE_TYPE_APP,
        "moduleName" => "About",
        "methodName" => "viewContact",
        "request" => new \Cherrycake\Actions\Request([
            "pathComponents" => [
                new \Cherrycake\Actions\RequestPathComponent([
                    "type" => REQUEST_PATH_COMPONENT_TYPE_FIXED,
                    "string" => "about"
                ]),
                new \Cherrycake\Actions\RequestPathComponent([
                    "type" => REQUEST_PATH_COMPONENT_TYPE_FIXED,
                    "string" => "contact"
                ])
            ]
        ])
    ])
]);

...
```

> See [RequestPathComponent::\_\_construct](../../reference/core-classes/requestpathcomponent/methods.md#__construct) to learn more about other options when setting up path components for complex routes.

