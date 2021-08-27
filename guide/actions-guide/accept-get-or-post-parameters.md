# Accept GET or POST parameters

To map actions that receive parameters, pass an array of [RequestParameter](../../reference/core-classes/requestparameter/) objects via the `parameters` key when creating [Request](../../reference/core-classes/request/) object. For example, mapping an action that receives a `userId` parameter via GET would look like this:

```php
...

$e->Actions->mapAction([
    "viewUser",
    new \Cherrycake\Actions\ActionHtml([
        "moduleType" => ACTION_MODULE_TYPE_APP,
        "moduleName" => "Users",
        "methodName" => "viewUser",
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

...
```

This action will be triggered when URLs like `/user?userId=381` are requested. You can then get the `userId` value just like we did above for dynamic paths:

```php
function viewUser($request) {
    echo "The requested user id ".$request->userId;
}
```

> Check out the [Security](../../reference/core-modules/security/) module to learn more about the `securityRules` and `filters` you can configure when mapping actions with `parameters`.

{% hint style="success" %}
See this example working in the [Cherrycake documentation examples](https://documentation-examples.cherrycake.io/example/actionsGuideAcceptGetOrPostParameters) site.
{% endhint %}

