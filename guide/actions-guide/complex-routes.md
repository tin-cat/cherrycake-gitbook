# Complex routes

In the example above, the `pathComponents` is left to false because we wanted the action to respond to requests to the root `/` page. To map actions that respond to more complex routes like `/about/contact`, we pass `pathComponents` an array of [RequestPathComponent](../../reference/core-classes/requestpathcomponent/) objects representing the segments of the path in between the `/` symbols.

In this example, we map an action that will respond when the `/about/contact` path is requested:

```php
...

$e->Actions->mapAction([
    "aboutContact",
    new \Cherrycake\ActionHtml([
        "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
        "moduleName" => "About",
        "methodName" => "viewContact",
        "request" => new \Cherrycake\Request([
            "pathComponents" => [
                new \Cherrycake\RequestPathComponent([
                    "type" => \Cherrycake\REQUEST_PATH_COMPONENT_TYPE_FIXED,
                    "string" => "about"
                ]),
                new \Cherrycake\RequestPathComponent([
                    "type" => \Cherrycake\REQUEST_PATH_COMPONENT_TYPE_FIXED,
                    "string" => "contact"
                ])
            ]
        ])
    ])
]);

...
```

> See [RequestPathComponent::\_\_construct](../../reference/core-classes/requestpathcomponent/methods.md#__construct) to learn more about other options when setting up path components for complex routes.

