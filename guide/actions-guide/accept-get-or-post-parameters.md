# Accept GET or POST parameters

To map actions that receive parameters, pass an array of [RequestParameter](../../reference/core-classes/requestparameter/) objects via the `parameters` key when creating [Request](../../reference/core-classes/request/) object. For example, mapping an action that receives a `userId` parameter via GET would look like this:

```php
...

$e->Actions->mapAction([
    "viewUser",
    new \Cherrycake\ActionHtml([
        "moduleType" => \Cherrycake\ACTION_MODULE_TYPE_APP,
        "moduleName" => "Users",
        "methodName" => "viewUser",
        "request" => new \Cherrycake\Request([
            "pathComponents" => [
                new \Cherrycake\RequestPathComponent([
                    "type" => \Cherrycake\REQUEST_PATH_COMPONENT_TYPE_FIXED,
                    "string" => "user"
                ])
            ],
            "parameters" => [
                new \Cherrycake\RequestParameter([
                    "type" => \Cherrycake\REQUEST_PARAMETER_TYPE_GET,
    						    "name" => "userId",
                    "securityRules" => [
                        \Cherrycake\SECURITY_RULE_TYPICAL_ID
                    ]
    						])
            ]
        ])
    ])
]);

...
```

This action will be triggered when URLs like `/user?userId=381` are requested. You can then get the `userId` value just like we did above for dynamic paths:

```php
function viewUser($request) {
    echo "The requested user id ".$request->userId;
}
```

> Check out the [Security](../../reference/core-modules/security/) module to learn more about the `securityRules` and `filters` you can configure when mapping actions with `parameters`.a

> This example is implemented in the [Cherrycake documentation examples repository](https://github.com/tin-cat/cherrycake-documentation-examples), in the `ActionsGuide` module, and runs by requesting a URL like `/actions-guide/user?userId=381`

