---
description: >-
  The Locale module provides localization functionalities for multilingual web
  sites with automatic detection, plus the handling of currencies, dates,
  timezones and more.
---

# Locale guide

The [Locale](../reference/core-modules/locale/) module provides some useful methods to format dates and currencies according to the specified locale, like [Locale::formatTimestamp](../reference/core-modules/locale/locale-methods.md#formattimestamp) and [Locale::formatCurrency](../reference/core-modules/locale/locale-methods.md#formatcurrency), but also provides a fully featured mechanism to build multilingual apps that you can even use to autodetect your user's localization and redirect them to the proper version of your site.

When you're using the [Locale](../reference/core-modules/locale/) module by including it in the [`dependentModules`](modules-guide.md#specifying-module-dependencies) list of your app module, 

## Domain based site localization

