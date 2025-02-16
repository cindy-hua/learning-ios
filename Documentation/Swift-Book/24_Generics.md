
# Swift Generics - Learning Notes

## **Key Concepts Learned**

### **1. Understanding Generics**
- **Generics** allow code to be **flexible, reusable, and type-safe** by allowing types to be parameterized.
- **Why use generics?**
  - Reduces code duplication.
  - Improves type safety.
  - Used in Swift’s standard library (`Array<T>`, `Dictionary<K, V>`).
- **Generic functions vs. Regular functions:**
  - Regular functions work with predefined types.
  - Generic functions work with **any type** specified at runtime.

### **2. Declaring and Using Generics**
- **Syntax for a generic function:**
  ```swift
  func functionName<T, U>(argumentOne: T, argumentTwo: U) {}
  ```
- ✅ **Generic functions can have multiple type parameters** (e.g., `<T, U>`).
- ✅ **Swift automatically infers generic types**, so you don’t always need to specify them explicitly.

### **3. Generic Types (Structs, Classes, Enums)**
- **Structs, classes, and enums** can also be generic:
  ```swift
  struct Stack<Element> {
      var items: [Element] = []
      mutating func push(_ item: Element) { items.append(item) }
      mutating func pop() -> Element? { return items.popLast() }
  }
  ```
- **Enums can also be generic!**
  ```swift
  enum Result<T> {
      case success(T)
      case failure(String)
  }
  ```
  - Useful for networking, API responses, and error handling.

### **4. Type Constraints in Generics**
- **Type constraints limit which types can be used as generics.**
- ✅ **Syntax for type constraints:**
  ```swift
  func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {}
  ```
- ✅ **Example with Comparable:**
  ```swift
  func compareValues<T: Comparable>(_ a: T, _ b: T) -> Bool {
      return a > b
  }
  ```
  - Only types conforming to `Comparable` can be used with this function.

### **5. Associated Types in Protocols**
- **Associated types (`associatedtype`) allow protocols to define a placeholder type.**
- ✅ **Difference from Generics:**
  - **Generics:** Require explicit type definition (`Array<Int>`).
  - **Associated types:** Infer the type when a concrete type conforms to the protocol.
- ✅ **Example:**
  ```swift
  protocol Container {
      associatedtype Item
      func add(_ item: Item)
  }
  
  struct IntContainer: Container {
      func add(_ item: Int) {
          print("Adding \(item)")
      }
  }
  ```

### **6. Generic Subscripts**
- **Subscripts can be generic, allowing dynamic retrieval of different types.**
- ✅ **Example:**
  ```swift
  struct DictionaryWrapper<Key: Hashable, Value> {
      private var storage: [Key: Value] = [:]
  
      subscript<T>(key: Key) -> T? {
          return storage[key] as? T
      }
  }
  ```

### **7. Practical Applications of Generics**
- ✅ **Flexible and reusable code** (e.g., `Array<T>` can store any type).
- ✅ **Useful for API handling** (e.g., `Result<T>` pattern).
- ✅ **Encapsulating constraints and behaviors in protocols.**
- **When NOT to use generics?**
  - When a function or type does not need to support multiple types.
  - When **type-specific optimizations** are needed.

### **Final Thoughts**
- **Generics make Swift more powerful and type-safe.**
- They are widely used in **Swift’s standard library**.
- **Associated types vs. Generics:** Associated types allow flexibility in protocols, while generics work well for defining reusable types and functions.
- **Enums, structs, classes, and even subscripts can be generic.**
