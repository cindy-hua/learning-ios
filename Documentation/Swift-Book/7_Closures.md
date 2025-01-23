
# Swift Closures - Learning Notes

## Key Concepts Learned

### Definition of Closures

- A closure is a block of code that executes together, similar to a function but without a name.
- Closures can capture values from their surrounding scope, such as within a function.

### Closure Syntax

- General syntax for closures:
  ```swift
  { (parameters) -> ReturnType in
      statements
  }
  ```
- **Simplifications**:
  - Type inference allows you to omit parameter and return types.
  - Shorthand argument names like `$0`, `$1`, etc., represent the first, second, and so on arguments.
  - Example:
    ```swift
    let add = { (a: Int, b: Int) -> Int in
        return a + b
    }
    let result = add(3, 5) // 8
    ```

### Trailing Closures

- If a closure is the last argument in a function, it can be written outside the parentheses of the function call.
- Example:
  ```swift
  let result = numbers.map { $0 * 2 }
  ```
- Makes the code more readable when the closure body is long.

### Escaping Closures

- An escaping closure is a closure that is executed after the function it was passed to returns.
  - Useful for asynchronous operations.
  - Requires the `@escaping` keyword.
- Example:
  ```swift
  var completionHandlers: [() -> Void] = []

  func addCompletionHandler(handler: @escaping () -> Void) {
      completionHandlers.append(handler) // Closure escapes here
  }
  ```

### Autoclosures

- An autoclosure is a closure automatically created to wrap an expression passed as an argument.
  - The closure is executed only when explicitly called.
- Useful for performance optimization to delay execution until it is needed.
- Example:
  ```swift
  func logMessage(_ message: @autoclosure () -> String) {
      print(message())
  }
  logMessage("This is a message")
  ```

### Practical Applications

- **Higher-Order Functions**: Closures are heavily used with functions like `map`, `filter`, and `reduce`.
  ```swift
  let numbers = [1, 2, 3, 4, 5]
  let evens = numbers.filter { $0 % 2 == 0 }
  print(evens) // [2, 4]
  ```

### 
