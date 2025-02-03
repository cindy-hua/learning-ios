
# Swift Macros - Learning Notes

## Key Concepts Learned

### **1. Definition of Macros**
- Macros **transform source code at compile time**, reducing the need for repetitive manual code.
- During compilation, Swift **expands** macros before building the code as usual.
- Unlike functions or computed properties, macros involve a **two-step process**: **declaration and implementation** happen separately.

### **2. Defining and Using Macros**
- A macro declaration specifies:
  - **Macro's name**
  - **Parameters**
  - **Where it can be used**
  - **What kind of code it generates**
- Macros improve **efficiency** and **maintainability** because:
  - Code updates in **one place** instead of multiple instances.
  - Reduces the risk of **inconsistent errors**.
- Macros **can take parameters**.

### **3. Types of Macros & Macro Expansion**
- **Freestanding macros** (`#macroName`) appear on their own.
- **Attached macros** modify the declaration they are attached to.
- During **compilation**, Swift first reads the Swift file and creates an **Abstract Syntax Tree (AST)**, which structures the code in-memory.
- **Macros operate at compile-time**, improving performance by avoiding runtime computation.

### **4. When to Prefer Macros Over Functions**
- **Use macros when**:
  - The logic needs to run **at compile-time** instead of runtime.
  - You want to **generate code dynamically** instead of writing repetitive code manually.
  - The macro is **reusable across different projects**.
- **Use functions when**:
  - The logic involves **runtime computations**.
  - You need **dynamic values that depend on program execution**.
  - You don’t need to modify the structure of your code.

### **5. Macros for Debugging and Logging**
- **Yes!** Macros are commonly used for **debugging and logging** by injecting extra code at compile time.
- Example:
  ```swift
  #macro debugPrint(value: Any) {
      print("DEBUG: \(value)")
  }
  ```
  - This lets you insert debug logging **without manually writing print statements everywhere**.

### **6. Practical Applications**
- Macros are useful when:
  - **Reducing boilerplate code**.
  - **Reusing** logic across different projects.
  - **Improving readability** and **performance** (if applicable).
- Since macros **execute at compile time**, they help optimize performance compared to runtime computations.
