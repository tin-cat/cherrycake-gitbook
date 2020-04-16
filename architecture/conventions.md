---
description: This are the official programming standards Cherrycake follows.
---

# Conventions

Cherrycake uses the [JavaScript conventions](https://www.w3schools.com/js/js_conventions.asp) for entity naming, file naming and code structure. Of course, you can use your favorite conventions in your Cherrycake app.

### Entities

* **camelCase** for variables, properties and methods.
* **PascalCase** for types and classes.
* **UPPER\_CASE\_SNAKE\_CASE** for defines.

For example:

```php
define("DEFINE_NAME", true);

$variableName = null;

class ClassName {
    var $propertyName;
    function methodName() {
        [...]
    }
}

$objectName = new ClassName;
```

### File naming

Class names, module names and directories follow the same **PascalCase** convention, take a look at the [Files structure](app-files-structure.md) section for more information.

{% hint style="warning" %}
Please note that class auto-loading might not work properly if you don't follow this naming conventions.
{% endhint %}

### Code structure

Feel free to use the structure methodology you prefer in your code. Cherrycake's own choice is tabs instead of spaces and a somewhat typical multi-line approach to function declarations and overall tidiness.

Here's an example code with some of this conventions in place:

```php
<?php // Use the full PHP opening tag instead of the shorthand <? for compatibility

class ClassName { // Brackets on the same line
    var $propertyName = 1 + 3; // Operators surrounded by spaces
    // Empty lines between logical blocks are acceptable to add readability
    /**
     * PHPDoc is used to document code when needed.
     * @param boolean $divisor The divisor.
     * @return boolean True on success, false on failure.
     */
    function methodName($divisor) { // No separation between the method/function name and the parenthesis
        global $e; // The Cherrycake engine is stored globally in the $e variable

        if ($this->propertyName > 100) // Control structures like if, for, while and switch are one space away from the parenthesis
            return false; // Single-line statements without brackets are acceptable, as long as they improve readability
                
        for ($i = 1; $i < 100; $i ++) // Space after semicolons in for control structures
            if ($i % $divisor == 0) // Nested control structures without brackets are acceptable, as long as they improve readability
                echo "$i is divisible by $divisor"; // Variable interpolation in strings is acceptable when it adds readability
        
        $e->ModuleName->methodName(
            $this->propertyName, // Multiline tabbed parameters are acceptable to add readability when the number of parameters is long
            [
                "id" => $this->propertyName,
                "key" => [
                    "a" => true, // Depth of multidimensional arrays is also expressed with tabs
                    "b" => 12
                ]
            ] // Specially when functions receive complex parameters like this hash array
        );
        
        return true;
    }
}

// No need to use the ?> PHP closing tag
```

{% hint style="info" %}
If you're contributing to the Cherrycake Engine, please follow this conventions.
{% endhint %}



