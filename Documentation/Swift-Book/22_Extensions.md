
# Swift Extensions - Learning Notes

## **Key Concepts Learned**

### **1. Understanding Extensions**
- Extensions allow you to **add functionality** to an existing type **without modifying** the original source code.
- They are useful for keeping code **modular** and **organized**.
- **Extensions differ from subclassing** because they don’t allow overriding behavior; they only add new functionality.

### **2. Declaring Extensions**
- Use the `extension` keyword followed by the type name:
  ```swift
  extension SomeType {
      // Add new functionality here
  }
  ```
- Extensions work with:
  - **Structs**
  - **Classes**
  - **Enums** (with limitations)
  - **Protocols**

### **3. Adding Functionality with Extensions**
✅ **You can add:**
- Computed properties (no stored properties)
- New instance methods and type methods
- Initializers
- Protocol conformance
- Nested types

❌ **You cannot:**
- Add stored properties
- Override existing methods
- Add new cases to an `enum`

### **4. Extensions with Protocol Conformance**
- You can use extensions to **make a type conform to a protocol**, making code more readable.
  ```swift
  protocol Greetable {
      func greet() -> String
  }

  extension String: Greetable {
      func greet() -> String {
          return "Hello, \(self)!"
      }
  }
  
  print("Swift".greet()) // ✅ "Hello, Swift!"
  ```
- This is useful for **keeping protocol implementations separate from the main type definition**.

### **5. Mutating Methods in Extensions**
- Extensions can define `mutating` methods for value types:
  ```swift
  extension Int {
      mutating func square() {
          self *= self
      }
  }
  var number = 4
  number.square()
  print(number) // ✅ 16
  ```
- The `mutating` keyword allows modifying `self` within a struct or enum.

### **6. Extending Enums**
- **Enums can be extended** to:
  - Add computed properties
  - Add methods
  - Conform to protocols
- **Enums cannot be extended** to add new cases or stored properties.
  ```swift
  enum Direction {
      case north, south, east, west
  }
  
  extension Direction {
      var isVertical: Bool {
          return self == .north || self == .south
      }
  }
  
  print(Direction.north.isVertical) // ✅ true
  ```

### **7. Practical Applications**
- **When to use an extension?**
  - To **keep code organized** when adding new functionality.
  - To **add protocol conformance** without modifying the original type.
  - To **group utility functions** for clarity.
  
- **Real-world examples**:
  - Adding convenience methods to `String`, `Array`, or `Int`.
  - Structuring protocol implementations separately for cleaner code.
  - Adding computed properties to framework types (e.g., UIKit, Foundation).

### **Final Thoughts**
- Extensions **don’t modify existing behavior** but make code more modular.
- They are **preferred over subclassing** when simply adding new functionality.
- **Enums can be extended, but not with new cases or stored properties**.
