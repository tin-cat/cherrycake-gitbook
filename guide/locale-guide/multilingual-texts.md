---
description: >-
  Locale allows you to change the language of your app based on the selected
  locale.
---

# Multilingual texts

To use the multilingual text features of the [Locale](../../reference/core-modules/locale/) module, Cherrycake uses the `cherrycake_locale_texts` and `cherrycake_locale_textcategories` database tables with the following structure:

> You can create this tables in your database by importing the `locale.sql` file you'll find in the [Cherrycake skeleton repository](https://github.com/tin-cat/cherrycake-skeleton), under the `install/database` directory.

## Text categories

Optionally, texts in the database can be organized in categories, this might come in handy if you have lots of texts.

Add your text categories as rows to the `cherrycake_locale_textcategories` table, here's the columns specification:

* **`code`** A unique identifier for the category, you'll be using it later to refer to this category in your code.
* **`description`** Describe the kind of texts you'll be storing in this category.

## Adding texts

Add translated texts as rows to the `cherrycake_locale_texts` table, with this column specification:

* **`textCategories_id`** The category id assigned in the `cherrycake_locale_textcategories` table.
* **`code`** A unique identifier for the text, you'll be using it later to refer to this text in your code.
* **`description`** Describe this text, and the context where it will be used.
* **`text_en`** The text in english.

## Retrieving multilingual texts

To retrieve a text based on the current locale language, use the [Locale::getText](../../reference/core-modules/locale/locale-methods.md#gettext) method. Imagine the `cherrycake_locale_textcategories` like this:

| id | code | description |
| :--- | :--- | :--- |
| 1 | general | General texts used throughout the site. |

And the `cherrycake_locale_texts` tables like this:

| id | textCategories\_id | code | description | text\_en | text\_es |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | 1 | test | The typical test text used as an example. | Hello world | Hola mundo |

You would access the text like this:

```php
echo $e->Locale->getText("general/test");
$e->Locale->setLocale("spain");
echo $e->Locale->getText("general/test");
```

```text
Hello world
Hola mundo
```

{% hint style="success" %}
See this example working in the [Cherrycake documentation examples](https://documentation-examples.cherrycake.io/example/localeGuideMultilingualTexts) site.
{% endhint %}

## Adding new languages

To add new languages, just add new columns to the cherrycake\_locale\_texts table. The column name must follow the syntax  `text_<language code>` For example, to add a text field for spanish, add the a field named `text_es`.

## Variables in localized texts

You can use simple variables in localized texts to help you build more complex sentences, like this:

| textCategories\_id | code | text\_en | text\_es |
| :--- | :--- | :--- | :--- |
| 1 | newMessages | You have {numberOfMessages} new messages. | Tienes {numberOfMessages} mensajes nuevos. |

```php
echo $e->Locale->getText("general/newMessages", [
    "variables" => [
        "numberOfMessages" => 5
    ]
]);
```

```text
You have 5 new messages.
```

