
# Swift Subscripts - Learning Notes

## Key Concepts Learned

### Definition of Subscripts
- Subscripts provide shortcuts to access member elements of a collection, list, or sequence.
- They are similar to functions in syntax but allow more concise access patterns.
- Example:
  ```swift
  subscript(index: Int) -> Int {
      get {
          // Return value
      }
      set {
          // Modify value
      }
  }
  ```

### Common Use Cases
- Subscripts are useful for:
  - Accessing elements in a collection or sequence.
  - Implementing custom data structures like matrices, where values are accessed via row and column indices.
  - Simplifying access to complex models.

### Declaration
- Subscripts can be declared in classes, structures, and enumerations.
- Example of a read-only subscript:
  ```swift
  struct TimeTable {
      let multiplier: Int
      subscript(index: Int) -> Int {
          return multiplier * index
      }
  }

  let threeTimesTable = TimeTable(multiplier: 3)
  print(threeTimesTable[5]) // 15
  ```

### Read-Only vs. Read-Write Subscripts
- **Read-Only Subscripts**:
  - Do not have a `set` block.
  - Useful when the subscript only retrieves values without modifying them.
  - Example:
    ```swift
    subscript(index: Int) -> Int {
        return multiplier * index
    }
    ```

- **Read-Write Subscripts**:
  - Include both `get` and `set` blocks.
  - Useful when the subscript needs to retrieve and modify values.

### Multiple Parameters
- Subscripts can take multiple parameters, making them versatile for use cases like accessing elements in a matrix.
  ```swift
  struct Matrix {
      let rows: Int, columns: Int
      var grid: [Double]

      subscript(row: Int, column: Int) -> Double {
          get {
              return grid[(row * columns) + column]
          }
          set {
              grid[(row * columns) + column] = newValue
          }
      }
  }
  ```

### Custom Parameter and Return Types
- Subscripts can accept parameters and return values of any type.
- This allows flexibility for custom data structures or models.

### 


