
# Swift Functions - Learning Notes

## Key Concepts Learned

### Variadic Parameters
- Variadic parameters allow a function to accept zero or more values of a specific type, behaving like an array of that type.
  ```swift
  func arithmeticMean(_ numbers: Double...) -> Double {
      var total: Double = 0
      for number in numbers {
          total += number
      }
      return total / Double(numbers.count)
  }
  arithmeticMean(1, 2, 3, 4, 5) // 3.0
  ```
- Functions can have multiple variadic parameters, but the first parameter after a variadic parameter must have an external name to avoid ambiguity.

### In-Out Parameters
- In-out parameters allow a function to modify the original value of a parameter by passing it as a reference (using `&`).
  ```swift
  func swapTwoInts(_ a: inout Int, _ b: inout Int) {
      let temporaryA = a
      a = b
      b = temporaryA
  }

  var someInt = 3
  var anotherInt = 107
  swapTwoInts(&someInt, &anotherInt)
  print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
  // Output: someInt is now 107, and anotherInt is now 3
  ```
- The `&` symbol is used to indicate that a variable is being passed by reference.
- Variadic parameters cannot be marked as `inout` due to type and memory management conflicts.

### Function Types
- A function type represents the parameter types and return type of a function.
  ```swift
  var mathFunction: (Int, Int) -> Int = addTwoInts
  ```
- Function types can be used as arguments or return values for other functions.
  ```swift
  func secondFunction(_ firstFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) -> Int {
      return firstFunction(a, b)
  }
  ```

### Nested Functions
- Nested functions are functions defined within another function.
  - Useful for encapsulating logic that is only needed within the enclosing function.
  ```swift
  func chooseStepFunction(backward: Bool) -> (Int) -> Int {
      func stepForward(_ input: Int) -> Int { return input + 1 }
      func stepBackward(_ input: Int) -> Int { return input - 1 }
      return backward ? stepBackward : stepForward
  }
  ```
- Nested functions can access variables from their enclosing scope.

### External Parameter Names
- External parameter names improve function readability by making calls resemble natural language.
  ```swift
  func greet(person: String, from hometown: String) {
      print("Hello \(person)! Glad you could visit from \(hometown).")
  }
  greet(person: "John", from: "Boston")
  ```

### Default Parameter Values
- Default values simplify function calls by removing the need to specify common parameter values.
  ```swift
  func greet(person: String, withGreeting greeting: String = "Hello") {
      print("\(greeting), \(person)!")
  }
  greet(person: "Alice") // "Hello, Alice!"
  ```

### 
