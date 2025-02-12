
# Swift Collection Types - Learning Notes

## Key Concepts Learned

### Set Operations
- **Set Functions**:
  - `intersection(_:)`: Returns the common elements of two sets.
  - `symmetricDifference(_:)`: Returns elements present in either set but not in both.
  - `union(_:)`: Combines all elements from both sets.
  - `subtracting(_:)`: Removes elements in one set that are also in another.
  - Example:
    ```swift
    let setA: Set = [1, 2, 3]
    let setB: Set = [3, 4, 5]
    print(setA.intersection(setB)) // [3]
    print(setA.symmetricDifference(setB)) // [1, 2, 4, 5]
    print(setA.union(setB)) // [1, 2, 3, 4, 5]
    print(setA.subtracting(setB)) // [1, 2]
    ```

- **Set Relationships**:
  - `isSubset(of:)`: Checks if all elements of one set are contained in another.
  - `isSuperset(of:)`: Checks if a set contains all elements of another.
  - `isStrictSubset(of:)`: Same as `isSubset`, but requires the sets to be unequal.
  - `isDisjoint(with:)`: Checks if two sets have no elements in common.
  - Example:
    ```swift
    let setA: Set = [1, 2, 3]
    let setB: Set = [3, 4, 5]
    print(setA.isSubset(of: setB)) // false
    print(setA.isSuperset(of: setB)) // false
    print(setA.isDisjoint(with: setB)) // false
    ```

### Dictionary Operations
- **Removing Key-Value Pairs**:
  - Assign `nil` to a key:
    ```swift
    var dictionary = ["a": 1, "b": 2]
    dictionary["a"] = nil // Removes key "a"
    ```
  - Use `removeValue(forKey:)`:
    ```swift
    dictionary.removeValue(forKey: "b") // Removes key "b"
    ```

- **Converting Keys or Values to Arrays**:
  - Convert dictionary keys or values to an array:
    ```swift
    let dictionary = ["a": 1, "b": 2]
    let keys = [String](dictionary.keys) // ["a", "b"]
    let values = [Int](dictionary.values) // [1, 2]
    ```
