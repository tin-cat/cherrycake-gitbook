---
description: >-
  The Locale module provides a mechanism to build apps that adapt to users using
  different languages, timezones, currencies and other local unit standards.
---

# Locale guide

To allow your app to work with different languages and localization settings, you must at least set up the `availableLocales`, `defaultLocale`, `canonicalLocale` and `availableLanguages` [configuration keys](../../reference/core-modules/locale/#configuration) in the `config/Locale.config.php` file like this:

```php
<?php

namespace Cherrycake;

$LocaleConfig = [
	"availableLocales" => [
		"main" => [
			"language" => LANGUAGE_ENGLISH,
			"dateFormat" => DATE_FORMAT_MIDDLE_ENDIAN,
			"temperatureUnits" => TEMPERATURE_UNITS_FAHRENHEIT,
			"currency" => CURRENCY_USD,
			"decimalMark" => DECIMAL_MARK_POINT,
			"measurementSystem" => MEASUREMENT_SYSTEM_IMPERIAL,
			"timeZone" => TIMEZONE_ID_ETC_UTC
		]
	],
	"defaultLocale" => "main",
	"canonicalLocale" => "main",
	"availableLanguages" => [LANGUAGE_ENGLISH]
];
```

* **`availableLocales`** The different localizations your app will support. See the [Locale configuration](../../reference/core-modules/locale/#configuration) for an explanation of the available options.
* **`defaultLocale`** The name of the locale to use as default.
* **`canonicalLocale`** The name of the locale to be considered the main locale of the app.
* **`availableLanguages`** An array of the languages that will be available in the app, from the available [`LANGUAGE_?`](../../reference/core-modules/locale/#constants) constants.

> If you don't setup your own `availableLocales`, or if you don't create a [Locale](../../reference/core-modules/locale/) configuration file at all,  a default locale named `main` will be used with the [default configuration values](../../reference/core-modules/locale/#configuration).

Once your `availableLocales` are in place, you can choose the locale to use by calling the [Locale::setLocale](../../reference/core-modules/locale/locale-methods.md#setlocale-localename) method. From that point on, all the texts, dates, timezones and other localized data will be retrieved using that locale's setup. For example:

```php
echo $e->Locale->formatTimestamp(time());
echo $e->Locale->formatCurrency(19.5);
echo $e->Locale->getTimeZoneName();
```

```text
5/18/20
USD19.50
Etc/UTC
```

## Multiple locales

If your app supports multiple localized versions with different languages or localization configurations, you just add more locales to your `Locale.config.php` file. Imagine we have a web site with a global version in english, and a local version for Spain:

```php
<?php

namespace Cherrycake;

$LocaleConfig = [
	"availableLocales" => [
		"global" => [
			"language" => LANGUAGE_ENGLISH,
			"dateFormat" => DATE_FORMAT_MIDDLE_ENDIAN,
			"temperatureUnits" => TEMPERATURE_UNITS_FAHRENHEIT,
			"currency" => CURRENCY_USD,
			"decimalMark" => DECIMAL_MARK_POINT,
			"measurementSystem" => MEASUREMENT_SYSTEM_IMPERIAL,
			"timeZone" => TIMEZONE_ID_ETC_UTC
		],
		"spain" => [
			"language" => LANGUAGE_SPANISH,
			"dateFormat" => DATE_FORMAT_LITTLE_ENDIAN,
			"temperatureUnits" => TEMPERATURE_UNITS_CELSIUS,
			"currency" => CURRENCY_EURO,
			"decimalMark" => DECIMAL_MARK_COMMA,
			"measurementSystem" => MEASUREMENT_SYSTEM_METRIC,
			"timeZone" => TIMEZONE_ID_EUROPE_MADRID
		]
	],
	"defaultLocale" => "global",
	"canonicalLocale" => "global",
	"availableLanguages" => [LANGUAGE_ENGLISH, LANGUAGE_SPANISH]
];
```

Now, we can switch the working locale whenever we need, and Locale will act accordingly:

```php
echo $e->Locale->formatTimestamp(time());
echo $e->Locale->formatCurrency(19.5);
echo $e->Locale->getTimeZoneName();

$e->Locale->setLocale("spain");

echo $e->Locale->formatTimestamp(time());
echo $e->Locale->formatCurrency(19.5);
echo $e->Locale->getTimeZoneName();
```

```text
5/18/20
USD19.50
Etc/UTC

18/5/20
19,50€
Europe/Madrid
```

{% hint style="success" %}
See this example working in the [Cherrycake documentation examples](https://documentation-examples.cherrycake.io/example/localeGuideBasic) site.
{% endhint %}

