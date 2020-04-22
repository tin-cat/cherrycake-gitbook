# Working with classes

Classes encapsulate [object-specific logic](../architecture/classes.md), and they also come in two flavors:

* \*\*\*\*[**Core classes**](../reference/core-classes/)\*\*\*\*
  * Ready-made classes provided by Cherrycake, providing useful object entities to interact with Cherrycake functionalities like the [Action](../reference/core-classes/action/) or the [RequestParameter](../reference/core-classes/requestparameter.md), and other generalist classes to use throughout your code like the [Item](../reference/core-classes/item.md) or the [Image](../reference/core-classes/image.md) classes.
* **App classes**
  * Classes created by the developer to encapsulate object logic, often inheriting from core classes like [Item](../reference/core-classes/item.md).
  * For example, in an e-commerce web application you might need a `Product` class, a `ProductCategory` class and perhaps a `CartItem` class, all them might extend the [Item](../reference/core-classes/item.md) core class.

## Loading classes

Classes are automatically loaded the first time they're used, so you don't have to worry to include them anywhere.

For example, to create an [Image](../reference/core-classes/image.md) object, just do this anywhere in your code:

```php
$image = new \Cherrycake\Image;
```

Likewise, to create an object of a class you've created \(an App class\), just remember to specify our app's namespace instead of `\Cherrycake\`:

```php
$product = new \CherrycakeApp\Product;
```

## App class files

The App classes you create must be stores in the `/classes` directory of your app, and the file name must match the class name, plus the `.class.php` extension.

> Note that file name for classes is case-sensitive.

> You can change the default `/classes` directory for the one of your choice by setting the `appClassesDir` setup key when calling [Engine::init](../reference/core-classes/engine.md#init-appnamespace-setup)

