---
description: >-
  Locale allows you to change the language of your app based on the selected
  locale.
---

# Multilingual texts

To use the multilingual text features of the [Locale](../../reference/core-modules/locale/) module, Cherrycake uses the `cherrycake_locale_texts` and `cherrycake_locale_textcategories` database tables with the following structure:

> You can create this tables in your database by importing the `locale.sql` file you'll find in the [Cherrycake skeleton repository](https://github.com/tin-cat/cherrycake-skeleton), under the `install/database` directory.

### Adding languages to the cherrycake\_locale\_texts table

You must add new text fields in the database for the languages you want to use in your app, with the name `syntax text_<language code>` For example, to add a text field for french, add the a field named `text_fr`.



