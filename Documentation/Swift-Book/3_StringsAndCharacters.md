
# Swift Strings and Characters - Learning Notes

## Key Concepts Learned

### Special Characters and String Interpolation
- To include special characters as part of strings in Swift:
  - Use `#` to escape special characters:
    ```swift
    print(#"
 "#) // Prints " 
 "
    ```
  - Use `\#()` for string interpolation with special characters.

### Unicode and Extended Grapheme Clusters
- **Unicode**:
  - An international standard for encoding, representing, and processing text in different writing systems.
  - Ensures consistent representation of characters across platforms.
- **Extended Grapheme Clusters**:
  - Each `Character` in Swift represents a single extended grapheme cluster.
  - Grapheme clusters are flexible, allowing representation of complex script characters and accents (e.g., `é` as `e + accent`).
  - Useful for languages with complex writing systems like Korean.

### Substrings and Memory Management
- A `Substring` shares memory with the original string.
  - Example: Extracting a prefix or suffix creates a `Substring`.
  - Substrings allow efficient memory usage for short-term operations.
  - For long-term storage, convert a `Substring` to a `String` to free up unused memory:
    ```swift
    let substring = fullString.prefix(5)
    let storedString = String(substring) // Converts Substring to String
    ```

### Collection Protocols and String Methods
- **Insert and Remove Methods**:
  - Work with types conforming to the `RangeReplaceableCollection` protocol (e.g., `Array`, `Set`, `String`).
  - Examples:
    ```swift
    var greeting = "Hello"
    greeting.insert("!", at: greeting.endIndex) // Inserts '!' at the end
    greeting.remove(at: greeting.index(before: greeting.endIndex)) // Removes the last character
    ```
- **Start and End Index Properties**:
  - Available for types conforming to the `Collection` protocol.
  - Provides precise control over string traversal and manipulation.
