# Modules injecting CSS and JavaScript

You know how to [add CSS or JavaScript files](./) to your sets so they get loaded in your web app, there's a better way to do it so it follows the [Cherrycake modules logic](../modules-guide.md) for encapsulation and dependency.

Since modules often represent isolated features of your web app, it makes sense to pair them with the piece of CSS and JavaScript code they need to run.

A simple way of doing it is by calling the Css::addFileToSet or Javascript::addFileToSet methods.

By doing this, you'll also get the benefits of dependencies: Whenever a module depends on another module, that module's CSS and JavaScript will also be loaded.

