---
description: >-
  The Locale module provides a mechanism to build apps that adapt to users using
  different languages, timezones, currencies and other local unit standards.
---

# Locale

> See the [Locale guide](../../../guide/locale-guide.md) to learn how to work with the Locale module.

## Configuration

* **`availableLocales`** A hash array of available localizations the app supports, where each key is the locale name, and each value a hash array with the keys below. By default, a locale named `main` is defined with the following default values.
  * **`domains`** An array of domains that will trigger this localization when the request to the app comes from one of them, or false if this is the only locale to be used always. Default: `false`
  * **`language`** The language used in this localization, one of the available `LANGUAGE_?` constants. Default: `LANGUAGE_ENGLISH`
  * **`dateFormat`** The date format used in this localization, one of the available `DATE_FORMAT_?` constants. Default: `DATE_FORMAT_MIDDLE_ENDIAN`
  * **`temperatureUnits`** The temperature units used in this localization, one of the available `TEMPERATURE_UNITS_?` constants. Default: `TEMPERATURE_UNITS_FAHRENHEIT`
  * **`currency`** The currency used in this localization, one of the available `CURRENCY_?` constants. Default: `CURRENCY_USD`
  * **`decimalMark`** The type character used when separating decimal digits in this localization, one of the available `DECIMAL_MARK_?` constants. Default: `DECIMAL_MARK_POINT`
  * **`measurementSystem`** The measurement system used in this localization, one of the available `MEASUREMENT_SYSTEM_?` constants. Default: `MEASUREMENT_SYSTEM_IMPERIAL`
  * **`timeZone`** The timezone id used in this localization, from the `cherrycake_location_timezones` table of the [Cherrycake skeleton database](../../../guide/getting-started/#setting-up-the-skeleton-database). Default: `532` \(532 is the id for the Etc/UTC time zone\)
* **`defaultLocale`** The locale name to use when it can not be auto-detected. Default: `main`
* **`canonicalLocale`** The locale to consider canonical, used i.e. in the [HtmlDocument](../htmldocument/) module to set the `rel="canonical"` meta tag, in order to let search engines understand that there are different pages in different languages that represent the same content.
* **`availableLanguages`** An array of the languages that are available for the app. The specified`textsTableName` should contain at least the proper `text_<language code>` fields for this languages. From the available `LANGUAGE_`? constants. Default: `[LANGUAGE_ENGLISH]`
* **`geolocationMethod`** The method to use to determine the user's geographical location, one of the available `GEOLOCATION_METHOD_?` constants.
* **`textsTableName`** The name of the table where multilingual localized texts are stored. See the `cherrycake_locale_texts` table in the [Cherrycake skeleton database](../../../guide/getting-started/#setting-up-the-skeleton-database). Default: `cherrycake_locale_texts`
* **`textsDatabaseProviderName`** The name of the database provider where the localized multilingual texts are found. Default: `main`
* **`textCategoriesTableName`** The name of the table where text categories are stored. See the `cherrycake_locale_textCategories` table in the [Cherrycake skeleton database](../../../guide/getting-started/#setting-up-the-skeleton-database). Default: `cherrycake_locale_textCategories`
* **`textCacheProviderName`** The name of the cache provider that will be used to cache localized multilingual texts. Default: `engine`
* **`textCacheKeyPrefix`** The prefix of the keys when storing texts into cache. Default: `LocaleText`
* **`textCacheDefaultTtl`** The default TTL for texts stored into cache. Default: `CACHE_TTL_NORMAL`
* **`timeZonesTableName`** The name of the table where the timezones are stored. See the `cherrycake_location_timezones` table in the [Cherrycake skeleton database](../../../guide/getting-started/#setting-up-the-skeleton-database). Default: `cherrycake_location_timezones`
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



* **`TIMESTAMP_FORMAT_BASIC`** Basic formatting, like `5/18/2020`
* **`TIMESTAMP_FORMAT_HUMAN`** Human readable formatting, like `may 18th, 2020`
* **`TIMESTAMP_FORMAT_RELATIVE_HUMAN`** Formatting relative to now, like `10 hours ago`



* **`ORDINAL_GENDER_MALE`**
* **`ORDINAL_GENDER_FEMALE`**



* **`GEOLOCATION_METHOD_CLOUDFLARE`** Uses [Cloudflare IP geolocation](https://support.cloudflare.com/hc/en-us/articles/200168236-Configuring-Cloudflare-IP-Geolocation) by reading the `CF-IPCountry` HTTP header added by Cloudflare when this option is enabled.





