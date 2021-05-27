# Variable path components

A lot of times we'll need to respond to requests where some component of the path is dynamic, like when we are attending requests like `/product/4739` to show some specific product id. For this, we use the `REQUEST_PATH_COMPONENT_TYPE_VARIABLE_NUMERIC` type instead, like this:

```php
...

$e->Actions->mapAction(
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
);

...
```

In this case, instead of passing a `string` like we do with the `REQUEST_PATH_COMPONENT_TYPE_FIXED` type for the `product` part of the path, we pass a `name` to identify the received value, and a `securityRules` array to be sure the value we receive is secure.

In our example, the `viewProduct` action is triggered when we receive a request like `/product/4739`, and we specify that `4739` will be stored as `productId`, that it cannot be empty and that it has to be a positive integer.

> Check out the [Security](../../reference/core-modules/security/) module to learn more about the `securityRules` and filters we can configure when mapping actions with `pathComponents`.

To receive the `productId` value that was passed when the client requested `/product/4739`,  we simply add a `request` parameter to the method triggered by the action \(`Products::view` in the example above\), and we'll get a [Request](../../reference/core-classes/request/) object that contains, among other useful things, the value of the `productId` path section:

```php
function view($request) {
    echo "The requested product id is ".$request->productId;
}
```

{% hint style="success" %}
See this example working in the [Cherrycake Documentation examples](https://documentation-examples.cherrycake.io/example/actionsGuideVariablePathComponents) site.
{% endhint %}

