# Stats events with additional dimensions

Adding additional dimensions to a [StatsEvent](../../reference/core-classes/statsevent/) class allows you to keep track of the event in relation to a certain identifier. The best way to understand this is via an example:

Imagine you want to trigger a StatsEvent every time a user in your web app logs in. A simple way of doing this would be to create a `StatsEventUserLogin` class just like we saw in the [Stats guide](./) main section:

```php
<?php

namespace CherrycakeApp;

class StatsEventUserLogin extends \Cherrycake\StatsEvent {
	protected $timeResolution = \Cherrycake\STATS_EVENT_TIME_RESOLUTION_DAY;
	protected $typeDescription = "User login";
}
```

And trigger it whenever the user logs in. If we do this in the example we saw in the [Creating a complete login workflow](../login-guide/creating-a-complete-login-workflow.md) section, we would trigger the `StatsEventUserLogin` in the `doLogin` method, like this:

```php
function doLogin($request) {
    global $e;
    $result = $e->Login->doLogin($request->email, $request->password);
    if (
        $result == \Cherrycake\LOGIN_RESULT_FAILED_UNKNOWN_USER
        ||
        $result == \Cherrycake\LOGIN_RESULT_FAILED_WRONG_PASSWORD
    ) {
        $e->Stats->trigger(new StatsEventUserLogin);
    
        $e->Output->setResponse(new \Cherrycake\ResponseTextHtml([
            "code" => \Cherrycake\RESPONSE_OK,
            "payload" => $e->HtmlDocument->header()."Login error".$e->HtmlDocument->footer()
        ]));
    }
    else {
        $e->Output->setResponse(new \Cherrycake\Response([
            "code" => \Cherrycake\RESPONSE_REDIRECT_FOUND,
            "url" => $e->Actions->getAction("loginGuideHome")->request->buildUrl()
        ]));
    }
}
```

But what if we wanted to keep track of the times each individual user logs in, instead of all the users? That's exactly what an additional dimension would do here. In this case, the user id would be the additional dimension.

To add the user id as an additional dimension to the `StatsEventUserLogin` class, we would modify it like this:

```php
<?php

namespace CherrycakeApp;

class StatsEventUserLogin extends \Cherrycake\StatsEvent {
    protected $timeResolution = \Cherrycake\STATS_EVENT_TIME_RESOLUTION_DAY;
    protected $typeDescription = "User login";
    protected $isSecondaryId = true;
    protected $secondaryIdDescription = "User id";

    function loadInline($data = false) {
        if ($data["userId"] ?? false)
            $this->secondary_id = $data["userId"];		
        return parent::loadInline($data);
    }
}
```

Notice we've added the `$isSecondaryId` and `$secondaryIdDescription` properties, and we overloaded the `StatsEvent::loadInline` method to retrieve the passed `userId` key and assign it to the `secondary_id` property. Don't forget to call the parent constructor at the end.

So now, when triggering the `StatsEventUserLogin` event, we can pass the user's id like this:

```php
$e->Stats->trigger(new StatsEventUserLogin(["userId" => $e->Login->user->id]));
```

> You can create another additional dimension by setting the `$isTertiaryId` and `$tertiaryIdDescription` properties, and updating the `loadInline` method accordingly.



