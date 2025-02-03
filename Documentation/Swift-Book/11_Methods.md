
# Summary: Methods in Swift

## Instance Methods
- Instance methods are functions that belong to a specific instance of a type and operate on it.
- Properties and other methods of the instance can be accessed directly within an instance method using their names.
- The `self` keyword:
  - Implicitly refers to the current instance of the type.
  - Used explicitly to resolve ambiguity (e.g., between parameter names and instance properties).

## Mutating Methods
- **Value types (structs and enums)** require the `mutating` keyword for methods that:
  - Modify their properties.
  - Assign a new instance to `self`.
  - Example:
    ```swift
    struct Point {
        var x: Int
        var y: Int

        mutating func moveTo(x: Int, y: Int) {
            self = Point(x: x, y: y)
        }
    }
    ```
- Classes do not require `mutating` because they are reference types and allow direct property modification.

## Type Methods
- **Type methods** are associated with the type itself rather than an instance.
  - Declared using `static func` for structs and enums.
  - For classes, use `static func` or `class func` (to allow subclass overrides).
- Called using the type name: `TypeName.methodName()`.
- Type methods cannot directly access instance properties or methods. However, they can operate on specific instances passed as parameters.

### Key Use Cases for Type Methods
1. **Utility Methods**:
   - Perform calculations or comparisons involving multiple instances.
   - Example: Comparing two rectangles to find the larger one.

2. **Factory Methods**:
   - Create new instances of the type without needing an existing instance.
   - Example: Constructing a rectangle from a given area and height.

## Method Overloading
- Method overloading allows multiple methods with the same name but different parameter types, counts, or labels.
- Swift differentiates overloaded methods by their **method signature** (name + parameters).
- **You cannot overload by changing only the return type**, as it’s not part of the signature.

## Special Features
1. **Default Parameters**:
   - Methods can have default parameter values to simplify calls by omitting certain arguments.

2. **Overriding Methods in Classes**:
   - Subclasses can override methods from their superclass to provide specific behavior.
   - Use `super.methodName()` to explicitly call the overridden method.

3. **`self` in Type Methods**:
   - In **type methods**, `self` refers to the type itself rather than an instance.

