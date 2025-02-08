
# Swift Type Casting - Learning Notes

## **Key Concepts Learned**

### **1. Basics of Type Casting**

- Type casting is used to **check an instance’s type** or **treat it as a different type** within its class hierarchy.
- This is particularly useful when working with **subclass instances stored as superclass types**.

### **2. `is` and `as` Operators**

- `is` → **Checks** if an instance is of a certain type and returns `true` or `false`.
- `as` → Used for **both upcasting and downcasting**.
- `as!` → **Forced Downcasting** (crashes at runtime if the cast fails).
- `as?` → **Optional Downcasting** (returns `nil` if the cast fails, making it safer).

### **3. Upcasting vs Downcasting**

#### **Upcasting**

- Converting a **subclass** instance to its **superclass** type.
- Useful for handling multiple subclasses under a common superclass.
- Example:
  ```swift
  class Animal {}
  class Dog: Animal {}

  let myDog = Dog()
  let animal: Animal = myDog // ✅ Upcasting
  ```

#### **Downcasting**

- Converting an instance from a **superclass** type back to a **subclass** type.
- Necessary when **subclass-specific behavior** is required.
- Example:
  ```swift
  if let myDog = animal as? Dog {
      print("Successfully downcasted to Dog")
  }
  ```

#### **Why `as!` is Dangerous**

- If the cast fails, it causes a **runtime crash**.

### **4. Practical Applications**

- Type casting is essential when dealing with **heterogeneous collections** (e.g., an array of mixed types).
