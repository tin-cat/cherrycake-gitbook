# Domain based site localization

[Locale](../../reference/core-modules/locale/) can automatically determine which one of the configured [`availableLocales`](../../reference/core-modules/locale/#configuration) to use based on the domain the user is visiting. To do this, just add the [`domains`](../../reference/core-modules/locale/#configuration) key when configuring your `availableLocales`.

For example, imagine the main english version of your web site runs on the domain [`litmind.com`](https://litmind.com), and you want the spanish version of the website to run under [`es.litmind.com`](https://es.litmind.com). Your `Locale.config.php` might look something like this:

```php
<?php

namespace Cherrycake;

$LocaleConfig = [
	"availableLocales" => [
		"main" => [
			"domains" => ["litmind.com"],
			"language" => LANGUAGE_ENGLISH,
			"dateFormat" => DATE_FORMAT_MIDDLE_ENDIAN,
			"temperatureUnits" => TEMPERATURE_UNITS_FAHRENHEIT,
			"currency" => CURRENCY_USD,
			"decimalMark" => DECIMAL_MARK_POINT,
			"measurementSystem" => MEASUREMENT_SYSTEM_IMPERIAL,
			"timeZone" => TIMEZONE_ID_ETC_UTC
		],
		"spain" => [
			"domains" => ["es.litmind.com"],
			"language" => LANGUAGE_SPANISH,
			"dateFormat" => DATE_FORMAT_LITTLE_ENDIAN,
			"temperatureUnits" => TEMPERATURE_UNITS_CELSIUS,
			"currency" => CURRENCY_EURO,
			"decimalMark" => DECIMAL_MARK_COMMA,
			"measurementSystem" => MEASUREMENT_SYSTEM_METRIC,
			"timeZone" => TIMEZONE_ID_EUROPE_MADRID
		]
	],
	"defaultLocale" => "main",
	"canonicalLocale" => "main",
	"availableLanguages" => [LANGUAGE_ENGLISH, LANGUAGE_SPANISH]
];
```

With this setup, the `main` locale will be automatically selected when visiting the site using the `litmind.com`, and the `spain` locale when visiting via `es.litmind.com`.

> Separating your website locales in different domains like this is one of the ways [Google recommends](https://support.google.com/webmasters/answer/182192#locale-specific-urls) to organize multilingual web sites for optimal SEO.

## Automatically redirecting users to the matching locale domain

[Google doesn't recommend](https://support.google.com/webmasters/answer/182192) performing an automatic redirection based on the user's perceived language or the geotargeting based on the client IP, and [Locale](../../reference/core-modules/locale/) doesn't implement such a mechanism for that reason.

Instead, you might want to give the user the option to switch to another language/localization of your site, specially if you've detected that it's different than the one he is currently visiting.

## Let Google discover the different versions of your site

For SEO purposes, it's quite important to help Google discover the different versions of your site when you have multilingual sites. One of the [recommended ways](https://support.google.com/webmasters/answer/189077) of doing so is by specifying `alternate` meta tags in your HTML `HEAD` section.

