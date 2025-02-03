
# Swift Protocols - Learning Notes

## **Key Concepts Learned**

### **1. Understanding Protocols**

- A **protocol** defines a blueprint of required properties and methods that a conforming type must implement.
- Protocols can be adopted by **classes, structs, and enums**, allowing multiple types to share functionality without inheritance.
- **Protocols vs. Classes:**
  - Classes support **single inheritance**, while protocols allow **multiple inheritance**.
  - Protocols define requirements **without implementation** (unless extended).

### **2. Declaring and Adopting Protocols**

- **Declaring a protocol:**
  ```swift
  protocol SomeProtocol {
      var someVar: SomeType { get set } // Must specify { get } or { get set }
      func someFunc()
  }
  ```
- **Conforming to a protocol:**
  ```swift
  struct SomeStruct: SomeProtocol {
      var someVar: SomeType
      func someFunc() {}
  }
  ```
- **Restricting protocols to classes only:**
  ```swift
  protocol ClassOnlyProtocol: AnyObject {}
  ```
  - Prevents `struct` and `enum` from conforming.

### **3. Protocol Requirements**

- A protocol can define **required properties** (computed or stored) and **methods**.
- Properties must specify `{ get }` (read-only) or `{ get set }` (read-write).
- **Optional requirements** need the `@objc` attribute:
  ```swift
  @objc protocol OptionalExample {
      @objc optional func optionalMethod()
  }
  ```
  - **Swift doesn’t support optional protocol requirements natively**, so `@objc` makes it interoperable with Objective-C.
  - `@objc` protocols can be adopted **only by classes**.

### **4. Protocol Inheritance**

- A protocol can inherit from multiple other protocols:
  ```swift
  protocol A {}
  protocol B {}
  protocol C: A, B {}
  ```
- **Difference from class inheritance:**
  - **Classes** can only inherit from **one** superclass.
  - **Protocols** can inherit from **multiple** protocols.

### **5. Protocol Composition**

- Protocol composition allows a type to conform to **multiple protocols** using `&`:
  ```swift
  protocol Readable {
      func read()
  }
  protocol Writable {
      func write()
  }
  struct File: Readable & Writable {
      func read() { print("Reading file") }
      func write() { print("Writing file") }
  }
  ```
- **Default Implementations:** If a type provides its own implementation of a method that already has a default implementation in an extension, the **custom implementation takes precedence**.

### **6. Protocol Extensions**

- **Adding default implementations** to a protocol:
  ```swift
  protocol Greetable {
      func greet() -> String
  }

  extension Greetable {
      func greet() -> String {
          return "Hello!"
      }
  }
  ```
- **Custom implementations override default ones:**
  ```swift
  struct Person: Greetable {
      func greet() -> String {
          return "Hi, I’m a person!"
      }
  }
  print(Person().greet()) // ✅ "Hi, I’m a person!"
  ```

### **7. Practical Applications**

- **Modularity** → Code can be split into reusable components.
- **Testability** → Mocking dependencies becomes easier.
- **Code flexibility** → Encourages **composition over inheritance**, reducing class hierarchy complexity.
