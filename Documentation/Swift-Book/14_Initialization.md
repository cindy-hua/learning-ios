
# Swift Initialization - Learning Notes

## Key Concepts Learned

### Definition of Initializers
- Initializers are used to create instances of a type in Swift.
- They ensure that all properties have a value at the time of initialization.
- Syntax:
  ```swift
  init(parameters) {
      // Initialization code
  }
  ```
- Initializers differ from regular methods in that they use the keyword `init` instead of `func`.
- Initializers can be overloaded, allowing multiple initializers for the same type with different parameter configurations.

### Default and Custom Initializers
- **Default Initializers**:
  - Automatically provided by Swift for types where all properties have default values.
  - Example:
    ```swift
    struct Person {
        var name: String = "Unknown"
        var age: Int = 0
    }
    let person = Person() // Default initializer
    ```
- **Custom Initializers**:
  - Useful for adding logic or making initialization more convenient.
  - Example:
    ```swift
    struct Temperature {
        var celsius: Double

        init(fromFahrenheit fahrenheit: Double) {
            celsius = (fahrenheit - 32) / 1.8
        }
    }
    ```

### Memberwise Initializers
- **Memberwise Initializers**:
  - Automatically available for structs that don’t define custom initializers.
  - Example:
    ```swift
    struct Rectangle {
        var width: Double
        var height: Double
    }
    let rect = Rectangle(width: 10.0, height: 5.0) // Memberwise initializer
    ```
- **Classes**:
  - Memberwise initializers are not automatically available for classes to avoid conflicts with complex initialization logic.

### Initializer Delegation
- **Initializer Delegation**:
  - When one initializer calls another to perform part of the initialization process.
- **Structs**:
  - Delegation is limited to other initializers within the same struct.
  - Example:
    ```swift
    struct Size {
        var width = 0.0
        var height = 0.0

        init(width: Double) {
            self.width = width
        }

        init(width: Double, height: Double) {
            self.init(width: width)
            self.height = height
        }
    }
    ```
- **Classes**:
  - Delegation must ensure all inherited stored properties are initialized.
  - Swift enforces safety with these rules:
    1. A designated initializer must call a designated initializer of its superclass.
    2. A convenience initializer must call another initializer of the same class.
    3. A convenience initializer must ultimately call a designated initializer.

### Failable Initializers
- **Definition**:
  - Initializers that may fail to create an instance, returning `nil` instead.
  - Declared using `init?`.
  - Example:
    ```swift
    struct Product {
        var name: String

        init?(name: String) {
            if name.isEmpty { return nil }
            self.name = name
        }
    }
    ```
- **Use Cases**:
  - Handling invalid initialization parameters.
  - When external resources or conditions might prevent successful initialization.

### Required Initializers
- **Definition**:
  - Ensures that every subclass of a class implements the initializer.
  - Declared using the `required` keyword.
  - Example:
    ```swift
    class SomeClass {
        required init() {
            // Required initializer
        }
    }

    class SubClass: SomeClass {
        required init() {
            // Subclass implementation
        }
    }
    ```

### Closure-Based Initialization
- **Use Case**:
  - When a property requires complex computation during initialization.
- **Advantages**:
  - The closure runs only once when the instance is created, avoiding repeated computation.
- Example:
  ```swift
  struct Chessboard {
      let boardColors: [Bool] = {
          var temporaryBoard: [Bool] = []
          var isBlack = false
          for _ in 1...8 {
              for _ in 1...8 {
                  temporaryBoard.append(isBlack)
                  isBlack.toggle()
              }
              isBlack.toggle()
          }
          return temporaryBoard
      }()

      func squareIsBlackAt(row: Int, column: Int) -> Bool {
          return boardColors[(row * 8) + column]
      }
  }
  ```
