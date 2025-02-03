
# Swift Deinitialization - Learning Notes

## Key Concepts Learned

### Definition of Deinitialization
- Deinitialization is a method called just before a class instance is deallocated.
- Declared using the `deinit` keyword.
- Example:
  ```swift
  class ExampleClass {
      deinit {
          print("Instance is being deallocated")
      }
  }
  ```

### Usage of Deinitializers
- Commonly used to perform cleanup tasks, such as:
  - Releasing file handles.
  - Stopping ongoing network requests or API interactions.
  - Freeing up system resources.
- Important for managing resources when working with external systems.

### Behavior and Restrictions
- Deinitializers are only available for **class types**.
- **Structs and Enums**:
  - Do not have deinitializers because they are **value types**, not managed by reference counting.
  - Memory for value types is automatically managed when they go out of scope.
- **Classes**:
  - Use **Automatic Reference Counting (ARC)** to manage memory, which requires deinitializers for custom cleanup.

### Practical Applications
- Deinitialization is important for:
  - Cleaning up resources tied to class instances.
  - Closing files, database connections, or other system resources when a class instance is deallocated.
- Example:
  ```swift
  class FileHandler {
      let fileName: String

      init(fileName: String) {
          self.fileName = fileName
          print("Opening file \(fileName)")
      }

      deinit {
          print("Closing file \(fileName)")
      }
  }

  var handler: FileHandler? = FileHandler(fileName: "data.txt")
  handler = nil
  // Prints:
  // Opening file data.txt
  // Closing file data.txt
  ```
