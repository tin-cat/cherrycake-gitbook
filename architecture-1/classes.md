---
description: >-
  Classes encapsulate the structure and the logic of entities in your
  application.
---

# Classes

Additionally to your own class implementations, Cherrycake provides core classes for entities that are used throughout the engine and that you can use or extend in your application, like the [Result](../reference/core-classes/result/) class, which represents the result of an operation of any kind, or the [Color](../reference/core-classes/color.md) class, which simply represents a color.

{% hint style="info" %}
A more complex example of core classes is the [Item](../reference/core-classes/item.md) class, which provides many useful methods to work with abstractions of objects you might be working with your application, or the [Items](../reference/core-classes/items.md) class, which provides methods to work with lists of [Item](../reference/core-classes/item.md) objects.
{% endhint %}

### Auto-loading

Classes are automatically loaded whenever they're needed, meaning you don't need to predict which classes you'll be using.

