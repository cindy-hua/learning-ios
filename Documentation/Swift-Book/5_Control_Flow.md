
# Swift Control Flow - Learning Notes

## Key Concepts Learned

### Loops and Iteration

#### Stride
- Use `stride(from:to:by:)` to generate sequences with specific intervals.
  ```swift
  for tickMark in stride(from: 0, to: 15, by: 3) {
      print(tickMark) // 0, 3, 6, 9, 12
  }
  ```
- Useful for UI programming, such as placing fewer tick marks on a timeline.

#### For-In Loops
- Can iterate over any class or collection type conforming to the `Sequence` protocol.
- Example usage with dictionaries:
  ```swift
  for (key, value) in dictionary {
      print("\(key): \(value)")
  }
  ```

#### While and Repeat-While Loops
- **While**: Condition is checked at the start of the loop.
- **Repeat-While**: Condition is checked at the end of each iteration.
  ```swift
  repeat {
      // Code to execute
  } while condition
  ```
- Useful when actions need to be executed at least once, such as game logic.

### Advanced Switch Statements

#### Tuples, Wildcards, and Ranges
- Switch cases can use wildcards (`_`) and ranges for matching:
  ```swift
  switch somePoint {
  case (0, _):
      print("Point is on the y-axis")
  case (1...3, 1...3):
      print("Point is within range")
  default:
      print("Point is outside")
  }
  ```

#### Value Binding
- Cases can bind matched values to temporary variables for use:
  ```swift
  switch anotherPoint {
  case (let x, 0):
      print("On the x-axis at \(x)")
  case let (x, y):
      print("At (\(x), \(y))")
  }
  ```

#### Where Clause
- Adds extra conditions to switch cases:
  ```swift
  switch yetAnotherPoint {
  case let (x, y) where x == y:
      print("Point is on the diagonal x == y")
  case let (x, y) where x == -y:
      print("Point is on the diagonal x == -y")
  default:
      print("Point is elsewhere")
  }
  ```

### Control Transfer Statements
- **Continue**: Skips to the next iteration in a loop.
- **Break**: Terminates a loop or exits a `switch` case.
- **Fallthrough**: Moves to the next `switch` case after executing the current one.
  ```swift
  switch number {
  case 1:
      print("Case 1")
      fallthrough
  case 2:
      print("Case 2")
  default:
      break
  }
  ```

### Guard Statements
- Improves readability by checking conditions early:
  ```swift
  func validateAge(_ age: Int) {
      guard age >= 18 else {
          print("Underage")
          return
      }
      print("Age is valid")
  }
  ```
- Exits the scope immediately if conditions aren’t met.

### Defer
- Executes at the end of the current scope, in reverse order (FILO):
  ```swift
  defer { print("Cleanup Task 1") }
  defer { print("Cleanup Task 2") }
  print("Start")
  // Output: Start, Cleanup Task 2, Cleanup Task 1
  ```
- Useful for resource management, like freeing memory or closing files.
