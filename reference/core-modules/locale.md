---
description: >-
  Provides localization functionalities for a multilingual site: Database-based
  multilingual texts, currency and dates formatting, timezones and other locale
  settings
---

# Locale

> See the [Css and Javascript guide](../../guide/css-and-javascript-guide/) to learn how to work with the Javascript module.

## Configuration

* **`availableLocales`** A hash array of available localisations the app supports, where each key is the locale name, and each value a hash array with the following keys:
  * **`domains`** An array of domains that will trigger this localization when the request to the app comes from one of them.
  * **`language`** The language used in this localization, one of the available `LANGUAGE_?` constants.
  * **`dateFormat`** The date format used in this localization, one of the available `DATE_FORMAT_?` constants.
  * **`temperatureUnits`** The temperature units used in this localization, one of the available `TEMPERATURE_UNITS_?` constants.
  * **`currency`** The currency used in this localization, one of the available `CURRENCY_?` constants.
  * **`decimalMark`** The type character used when separating decimal digits in this localization, one of the available `DECIMAL_MARK_?` constants.
  * **`measurementSystem`** The measurement system used in this localization, one of the available `MEASUREMENT_SYSTEM_?` constants.
  * **`timeZone`** The timezone id used in this localization, from the `cherrycake_location_timezones` table of the [Cherrycake skeleton database](../../guide/getting-started/#setting-up-the-skeleton-database).
* **`defaultLocale`** The locale name to use when it can not be auto-detected.
* **`canonicalLocale`** The locale to consider canonical, used i.e. in the [HtmlDocument](htmldocument/) module to set the `rel="canonical"` meta tag, in order to let search engines understand that there are different pages in different languages that represent the same content.
* **`availableLanguages`** An array of the languages that are available for the app. The specified`textsTableName` should contain at least the proper `text_<language code>` fields for this languages. From the available `LANGUAGE_`? constants.
* **`geolocationMethod`** The method to use to determine the user's geographical location, one of the available `GEOLOCATION_METHOD_?` constants.
* **`textsTableName`** The name of the table where multilingual localized texts are stored. See the `cherrycake_locale_texts` table in the [Cherrycake skeleton database](../../guide/getting-started/#setting-up-the-skeleton-database). Default: `cherrycake_locale_texts`
* **`textsDatabaseProviderName`** The name of the database provider where the localized multilingual texts are found. Default: `main`
* **`textCategoriesTableName`** The name of the table where text categories are stored. See the `cherrycake_locale_textCategories` table in the [Cherrycake skeleton database](../../guide/getting-started/#setting-up-the-skeleton-database). Default: `cherrycake_locale_textCategories`
* **`textCacheProviderName`** The name of the cache provider that will be used to cache localized multilingual texts. Default: `engine`
* **`textCacheKeyPrefix`** The prefix of the keys when storing texts into cache. Default: `LocaleText`
* **`textCacheDefaultTtl`** The default TTL for texts stored into cache. Default: `CACHE_TTL_NORMAL`
* **`timeZonesTableName`** The name of the table where the timezones are stored. See the `cherrycake_location_timezones` table in the [Cherrycake skeleton database](../../guide/getting-started/#setting-up-the-skeleton-database). Default: `cherrycake_location_timezones`
* **`timeZonesDatabaseProviderName`** The name of the database provider where the timezones are found. Default: `main`
* **`timeZonesCacheProviderName`** The name of the cache provider that will be user to cache timezones. Default: `engine`
* **`timeZonesCacheKeyPrefix`** The prefix of the keys when storing timezones into cache. Default:`LocaleTimeZone`
* **`timeZonesCacheDefaultTtl`** The default TTL for timezones stored into cache. Default: `CACHE_TTL_NORMAL`

## Constants

* **`LANGUAGE_ENGLISH`**
* **`LANGUAGE_SPANISH`**



* **`DATE_FORMAT_LITTLE_ENDIAN`** Almost all the world, like "20/12/2010", "9 November 2003", "Sunday, 9 November 2003", "9 November 2003"
* **`DATE_FORMAT_BIG_ENDIAN`** Asian countries, Hungary and Sweden, like "2010/12/20", "2003 November 9", "2003-Nov-9, Sunday"
* **`DATE_FORMAT_MIDDLE_ENDIAN`** United states and Canada, like "12/20/2010", "Sunday, November 9, 2003", "November 9, 2003", "Nov. 9, 2003", "Nov/9/2003"



* **`TEMPERATURE_UNITS_FAHRENHEIT`**
* **`TEMPERATURE_UNITS_CELSIUS`**

 ****

* **`CURRENCY_USD`**
* **`CURRENCY_EURO`**



* **`DECIMAL_MARK_POINT`**
* **`DECIMAL_MARK_COMMA`**



* **`MEASUREMENT_SYSTEM_IMPERIAL`**
* **`MEASUREMENT_SYSTEM_METRIC`**



* **`HOURS_FORMAT_12H`**
* **`HOURS_FORMAT_24H`**



* **`TIMESTAMP_FORMAT_BASIC`**
* **`TIMESTAMP_FORMAT_HUMAN`**
* **`TIMESTAMP_FORMAT_RELATIVE_HUMAN`**



* **`ORDINAL_GENDER_MALE`**
* **`ORDINAL_GENDER_FEMALE`**



* **`GEOLOCATION_METHOD_CLOUDFLARE`**





