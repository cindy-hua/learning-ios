
# Swift Inheritance - Learning Notes

## Key Concepts Learned

### Definition of Inheritance
- Inheritance allows a class (subclass) to inherit all properties and methods of another class (superclass).
- Subclasses can add complementary properties and methods or override existing ones.
- Syntax for declaring a subclass:
  ```swift
  class SubclassName: SuperclassName {}
  ```

### Overriding
- Subclasses can redefine a method, property, or subscript from the superclass.
- The `override` keyword is required to explicitly indicate that the subclass is replacing functionality from the superclass.
- Example:
  ```swift
  class Superclass {
      func someMethod() {
          print("Superclass method")
      }
  }

  class Subclass: Superclass {
      override func someMethod() {
          print("Subclass method")
      }
  }
  ```

### Accessing Superclass Members
- Subclasses can access properties, methods, or subscripts from the superclass using the `super` keyword.
- Examples:
  ```swift
  super.propertyName
  super.methodName()
  ```

### Preventing Inheritance
- Use the `final` keyword to prevent a class from being subclassed or to prevent specific methods, properties, or subscripts from being overridden.
- Examples:
  ```swift
  final class FinalClass {}
  final var propertyName: Int
  final func someMethod() {}
  ```

### 

