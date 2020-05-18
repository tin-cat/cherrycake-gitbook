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
			"language" => \Cherrycake\Modules\LANGUAGE_ENGLISH,
			"dateFormat" => \Cherrycake\Modules\DATE_FORMAT_MIDDLE_ENDIAN,
			"temperatureUnits" => \Cherrycake\Modules\TEMPERATURE_UNITS_FAHRENHEIT,
			"currency" => \Cherrycake\Modules\CURRENCY_USD,
			"decimalMark" => \Cherrycake\Modules\DECIMAL_MARK_POINT,
			"measurementSystem" => \Cherrycake\Modules\MEASUREMENT_SYSTEM_IMPERIAL,
			"timeZone" => 216
		]
	],
	"defaultLocale" => "main",
	"canonicalLocale" => "main",
	"availableLanguages" => [\Cherrycake\Modules\LANGUAGE_ENGLISH]
];
```

* **`availableLocales`** The different localizations your app will support. See the [Locale configuration](../../reference/core-modules/locale/#configuration) for an explanation of the available options.
* **`defaultLocale`** The name of the locale to use as default.
* **`canonicalLocale`** The name of the locale to be considered the main locale of the app.
* **`availableLanguages`** An array of the languages that will be available in the app, from the available [`LANGUAGE_?`](../../reference/core-modules/locale/#constants) constants.

> If you don't setup your own `availableLocales`, or if you don't create a [Locale](../../reference/core-modules/locale/) configuration file at all,  a default locale named `main` will be used with the [default configuration values](../../reference/core-modules/locale/#configuration).

When you're using the [Locale](../../reference/core-modules/locale/) module by including it in the [`dependentModules`](../modules-guide.md#specifying-module-dependencies) list of your app module.

## Domain based site localization

## Automatic language detection

Because [Google doesn't recommend](https://support.google.com/webmasters/answer/182192) performing an automatic redirection to the user's perceived language, [Locale](../../reference/core-modules/locale/) doesn't implement such a mechanism. Instead, you might want to show the user the option to switch to another language/localization, specially if you've detected that it's different than the one he is currently visiting.

