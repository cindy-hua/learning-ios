
# Swift Basics Chapter - Learning Notes

## Key Concepts Learned

### Multiple Declarations
- Swift allows multiple declarations in a single line:
  ```swift
  var x = 0, y = 0, z = 0
  ```

### Semicolons
- Semicolons can be used to write multiple separate statements on a single line:
  ```swift
  let cat = "🐱"; print(cat)
  ```

### UInt and Number Representations
- Swift provides `UInt` for unsigned integers.
- Numbers can be written in different bases (binary, hexadecimal, etc.):
  ```swift
  let binaryNumber = 0b1010 // Binary
  let hexNumber = 0xA // Hexadecimal
  ```
- Skimmed this section and will revisit as needed.

### Type Aliases
- `typealias` can be used to give an existing type a contextually appropriate name:
  ```swift
  typealias AudioSample = UInt16
  ```

### Tuples
- Tuples can group multiple values into a single compounded value:
  ```swift
  let http404Error = (404, "Not Found")
  ```
- Access tuple elements by:
  - Position: `http404Error.0`
  - Name: `http404Error.1`

### Conditional Statements
- A single `if` statement can separate conditions with a comma, acting as an alternative to `&&`:
  ```swift
  if condition1, condition2 {
      // Execute if both conditions are true
  }
  ```

### Implicitly Unwrapped Optionals
- Declared with `!` instead of `?`.
- Used when a value is guaranteed to exist after initialization.
  ```swift
  let assumedString: String! = "Hello"
  print(assumedString) // No need to unwrap
  ```
- Must be handled carefully to avoid runtime errors.

### Assertions and Preconditions
- **Assertions:** Ensure valid data during debugging. Not evaluated in production builds:
  ```swift
  assert(age >= 0, "Age cannot be negative")
  ```
- **Preconditions:** Checked in both debug and production modes:
  ```swift
  precondition(index >= 0 && index < array.count, "Index out of range")
  ```

## Key Questions Answered

### Can `let` and `var` be used together in a single line?
- No, you cannot mix `let` and `var` in the same declaration line.

### When are semicolons necessary?
- To separate multiple statements on a single line.

### When to use `UInt`?
- When negative values are not needed (e.g., audio processing).

### How to access tuple elements?
- By position or by name:
  ```swift
  let coordinates = (x: 10, y: 20)
  print(coordinates.0) // 10
  print(coordinates.x) // 10
  ```

### When to use implicitly unwrapped optionals?
- When a value is guaranteed to be initialized before it is accessed (e.g., provided by another program or process).

### Difference between `assert` and `precondition`?
- **Assert**: For debug builds only.
- **Precondition**: Enforced in both debug and production builds.
