
# Swift Error Handling - Learning Notes

## Key Concepts Learned

### **Definition of Error Handling**
- Error handling in Swift is the process of responding to and recovering from error conditions.
- Swift provides structured error handling with `throw`, `do-catch`, `try?`, and `try!`.
- Unlike exception-based languages, Swift’s error handling ensures that errors are handled explicitly.

### **Declaring and Representing Errors**
- Errors in Swift are represented by types that conform to the `Error` protocol.
- Typically, errors are declared using an `enum` with different cases:
  ```swift
  enum TypeOfError: Error {
      case invalidInput
      case networkFailure
  }
  ```

### **Throwing and Catching Errors**
- A function that can throw an error is declared using `throws`:
  ```swift
  func riskyFunction() throws -> Int {
      if Bool.random() {
          return 42
      } else {
          throw NSError(domain: "TestError", code: 1)
      }
  }
  ```
- When calling a function that throws an error, you must use `try`:
  ```swift
  do {
      let result = try riskyFunction()
      print("Success! Result is \(result)")
  } catch {
      print("An error occurred: \(error)")
  }
  ```
- If an error is thrown and not caught, it must be handled in a `catch` block, or the function must propagate it.

### **Handling Errors with Different Strategies**
#### **1. `do-catch` (Explicit Error Handling)**
- Does **not** modify the return type.
- Allows for structured error handling:
  ```swift
  do {
      let value = try riskyFunction()
      print(value)
  } catch {
      print("Error: \(error)")
  }
  ```

#### **2. `try?` (Convert Error to `nil`)**
- Converts the result into an **optional** (`T?`).
- Returns `nil` if an error occurs, avoiding crashes.
  ```swift
  let result: Int? = try? riskyFunction()
  print(result) // Either "Optional(42)" or "nil"
  ```

#### **3. `try!` (Force Success, Risky)**
- Assumes the function will **not** throw an error.
- If an error occurs, **the program crashes**.
  ```swift
  let result: Int = try! riskyFunction() // Crashes if an error occurs
  print(result)
  ```

### **Propagating Errors**
- `throws` does **not** mean the function returns an optional; it indicates that the function **may throw** an error that must be handled.
- Example of propagating errors:
  ```swift
  func anotherFunction() throws {
      try riskyFunction() // Must handle or propagate
  }
  ```
- The caller must then handle the error using `do-catch`, `try?`, or `try!`.

### **Comparison of Try Methods**
| Method  | Return Type | Behavior |
|---------|------------|-----------|
| `try` (inside `do-catch`) | **Same as function** | Explicit error handling |
| `try?` | **Optional (`T?`)** | Returns `nil` if an error occurs |
| `try!` | **Same as function (`T`)** | Crashes if an error occurs |

### **Practical Applications**
- Error handling is crucial in real-world projects where dependencies (e.g., APIs, user input, or files) may introduce unexpected errors.
- Swift’s structured error handling improves reliability by allowing graceful failure instead of crashes.
- Example:
  ```swift
  func loadFile(named filename: String) throws -> String {
      guard filename != "" else { throw TypeOfError.invalidInput }
      return "File content"
  }
  
  do {
      let content = try loadFile(named: "data.txt")
      print(content)
  } catch {
      print("Failed to load file: \(error)")
  }
  ```
