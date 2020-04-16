---
description: >-
  Classes encapsulate the object-specific structure and logic of entities in
  Cherrycake and in your application.
---

# Classes

Additionally to your own class implementations, Cherrycake provides core classes for entities that are used throughout the engine and that you can use or extend in your application, like the [Result](../reference/core-classes/result/) class, which represents the result of an operation of any kind, or the [Color](../reference/core-classes/color.md) class, which simply represents a color.

{% hint style="info" %}
A more complex example of core classes is the [Item](../reference/core-classes/item.md) class, which provides many useful methods to work with abstractions of objects, or the [Items](../reference/core-classes/items.md) class, which provides methods to work with lists of [Item](../reference/core-classes/item.md) objects.
{% endhint %}

### Auto-loading

Classes are automatically loaded whenever they're needed, meaning you don't need to predict which classes you'll be using.

### What's the difference between a class and a module?

Modules are intended to pack **process-specific** functionality, can be triggered with actions \(see [Lifecycle](lifecycle/)\), can have configuration files and can even contain dependent classes. Classes are intended to pack **object-specific** functionality,  cannot be triggered and don't get configuration files.

{% hint style="info" %}
#### Example

If you're creating a social networking web application, the code to show the user profile page would go in a **module** you might want to call _ProfilePage_. In the other hand, you might want to have a _User_ **class** to hold the information and the logic for that specific user.

In your architecture, the _ProfilePage_ module will query the [Database](../reference/core-modules/database.md) module for a specific user, and you'll get a _User_ object in return. The _ProfilePage_ module will then take care of building and showing the profile page using that _User_ object, most probably using the [Patterns](../reference/core-modules/patterns.md) module.
{% endhint %}

