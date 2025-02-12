
# Summary: Properties in Swift

## Stored Properties
1. Stored properties are part of types like `struct`, `class`, or `enum` and are declared using `var` or `let`.
   - **Key Difference**: Modifying a stored property in a **class** does not create a new instance since classes are reference types, unlike **structs**, which are value types.
2. Stored properties can have default values:
   ```swift
   var variableName: VariableType = defaultValue
   ```

## Lazy Stored Properties
3. Lazy properties are initialized only the first time they are accessed.
4. Lazy properties **cannot** exist in an immutable (`let`) structure because they are initialized after the instance is created, which would violate immutability.

## Computed Properties
5. Computed properties are recalculated each time they are accessed and differ from stored properties because they do not store a value.
6. Computed properties can be **read-only** if they have only a `get` block:
   ```swift
   var computedProperty: Int {
       get { value * 2 }
   }
   ```

## Property Observers
7. Property observers (`willSet` and `didSet`) execute before and after the value of a **stored property** is changed.
   - **Important**: Observers cannot be used with **computed properties** because computed properties already handle setting logic via the `set` block.
8. Global variables can have property observers and computed values, but their initialization behavior is similar to lazy properties.

## Type Properties
9. Type properties are shared across all instances of a type and are declared with the `static` keyword:
   ```swift
   struct Example {
       static var typeProperty = "Shared Value"
   }
   ```
   - In **classes**, you can also use `class` to allow subclass overrides.
10. Type properties are lazily initialized by default, and you **do not** need to specify `lazy`. Stored type properties **must** have default values since types lack an initializer.

## Property Wrappers
11. Property wrappers encapsulate reusable logic applied to properties, such as validation, transformation, or metadata handling.
12. The `wrappedValue` represents the actual value managed by the property wrapper. Example:
    ```swift
    @propertyWrapper
    struct Wrapper {
        private var value: Int
        var wrappedValue: Int {
            get { value }
            set { value = max(0, newValue) } // Example validation
        }
    }
    ```
13. The `projectedValue` (accessed via `$`) provides additional functionality or metadata about the wrapped property. Example in SwiftUI:
    ```swift
    @State private var name = ""
    TextField("Enter name", text: $name) // Binding via $
    ```


