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

## Adding multilingual texts

Add translated texts as rows to the `cherrycake_locale_texts` table, with this column specification:

* **`textCategories_id`** The category id assigned in the `cherrycake_locale_textcategories` table.
* **`code`** A unique identifier for the text, you'll be using it later to refer to this text in your code.
* **`description`** Describe this text, and the context where it will be used.
* **`text_en`** The text in english.

## Adding new languages

To add new languages, just add new columns to the cherrycake\_locale\_texts table. The column name must follow the syntax  `text_<language code>` For example, to add a text field for spanish, add the a field named `text_es`.



