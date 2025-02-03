
# Swift Nested Types - Learning Notes

## **Key Concepts Learned**

### **1. Understanding Nested Types**

- Nested types are types that are **defined inside another type**.
- They improve code organization by grouping utility types that are **only relevant** within the context of a more complex type.
- This approach **enhances readability** and keeps related logic encapsulated.

### **2. Declaring Nested Types**

- You declare a nested type **just like any other type**, but within another type.
- You can nest:
  - **Structures (`struct`)**
  - **Enumerations (`enum`)**
  - **Classes (`class`)**
- Example:
  ```swift
  struct OuterStruct {
      struct NestedStruct {
          let message = "Hello from NestedStruct"
      }
  }
  ```

#### **Nested Classes**

- **You can nest classes**, but they behave differently because **classes are reference types**.
- Nested classes are less common compared to nested structs and enums.
- Example:
  ```swift
  struct OuterStruct {
      class InnerClass {
          var value = 10
      }
  }
  ```

### **3. Accessing Nested Types**

- Nested types are accessed using the **dot syntax**:
  ```swift
  let nestedInstance = OuterStruct.NestedStruct()
  print(nestedInstance.message) // ✅ "Hello from NestedStruct"
  ```
- **Visibility Modifiers**: Nested types can be restricted in scope using `private`, `fileprivate`, or `internal`.

### **4. Practical Applications**

- **Use nested types when**:
  - The type is **only relevant within another type**.
  - It helps **organize** related values and logic.
- **Example: Nested Enums in Structs**
  ```swift
  struct Car {
      enum CarType {
          case sedan, suv, convertible
      }
      
      let type: CarType
  }
  ```
  - The `CarType` enum is **only meaningful within `Car`**, making it logical to nest it inside the struct.

### **Final Thoughts**

- Nested types improve **code clarity and maintainability** by **keeping related logic encapsulated**.
- **Nested classes are valid but less commonly used** compared to structs and enums.
