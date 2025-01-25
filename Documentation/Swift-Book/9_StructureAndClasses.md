
# Swift Structures and Classes - Learning Notes

## Key Concepts Learned

### Definition of Structures and Classes
- **Structures**: Value types that copy data when assigned or passed around.
- **Classes**: Reference types that share data when assigned or passed around.
- Declaration syntax:
  ```swift
  struct SomeStruct {
      var someVar: Type = defaultValue
  }

  class SomeClass {
      var someVar: Type = defaultValue
  }
  ```

### Value vs. Reference Types
- **Value Types**:
  - When assigning or passing a value type, a new copy of the data is created.
  - Example:
    ```swift
    struct Point {
        var x: Int
        var y: Int
    }
    var point1 = Point(x: 0, y: 0)
    var point2 = point1 // Copies the data
    point2.x = 10
    print(point1.x) // 0
    ```
- **Reference Types**:
  - When assigning or passing a reference type, the same instance is shared.
  - Example:
    ```swift
    class Point {
        var x: Int
        var y: Int

        init(x: Int, y: Int) {
            self.x = x
            self.y = y
        }
    }
    var point1 = Point(x: 0, y: 0)
    var point2 = point1 // Shares the instance
    point2.x = 10
    print(point1.x) // 10
    ```

### Initialization
- Structures and classes can have properties with default values.
- Custom initializers can be defined to control how instances are created.

### Mutability
- **Structures**:
  - Require the `mutating` keyword for methods that modify properties.
  - Example:
    ```swift
    struct Point {
        var x: Int
        var y: Int

        mutating func moveBy(dx: Int, dy: Int) {
            x += dx
            y += dy
        }
    }
    ```
- **Classes**:
  - Properties can be modified even if the instance is declared as `let`.
  - Example:
    ```swift
    class Point {
        var x: Int
        var y: Int

        init(x: Int, y: Int) {
            self.x = x
            self.y = y
        }
    }
    let point = Point(x: 0, y: 0)
    point.x = 10 // Allowed
    ```

### Inheritance
- Only classes support inheritance.
- This chapter provides minimal detail about inheritance, which is covered in a later chapter.

### Identity Operators
- **Identity Operators (`===` and `!==`)**:
  - Used to check if two class instances are the same reference.
  - Example:
    ```swift
    let point1 = Point(x: 0, y: 0)
    let point2 = point1
    print(point1 === point2) // true
    ```

### Practical Use
- **Structures**:
  - Preferred for simpler models or data types where copying data is sufficient.
- **Classes**:
  - Useful when shared data or inheritance is needed.
