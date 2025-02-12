
# Swift Concurrency - Learning Notes

## Key Concepts Learned

### **1. Definition of Concurrency**
- Concurrency is the combination of asynchronous and parallel execution.
- Swift’s concurrency model is built **on top of threads** but abstracts direct thread management, ensuring safer and more efficient execution.

### **2. Async and Await**
- `async` marks a function that can **be suspended and resumed later**.
- `await` is used before calling an `async` function to indicate that **execution may pause** until the function completes.
- Syntax:
  ```swift
  func fetchData() async -> String {
      return "Data loaded"
  }
  ```
  ```swift
  func asyncFunction() async {
      let result = await fetchData() 
      print(result)
  }
  ```
- **Can `await` be used outside an `async` function?** ❌ No.
  - **Fix:** If you need to call an async function from a non-async function, wrap it in `Task {}`:
    ```swift
    func syncFunction() {
        Task {
            let result = await fetchData()
            print(result)
        }
    }
    ```

### **3. Tasks and Task Groups**
- **`Task`**: A unit of work that runs asynchronously.
- **Task Groups**: Allow multiple tasks to run concurrently in a structured way.
- **`Task.detached`**: Runs outside of structured concurrency **without a parent task**, making it more error-prone.

### **4. Actors and Data Isolation**
- **Actors** safely share mutable state between concurrent tasks.
- Unlike classes, **only one task at a time** can access an actor’s mutable properties.
- **Actor functions must be called with `await`**, and execution suspends if another task is already interacting with the actor.
- Example:
  ```swift
  actor BankAccount {
      var balance: Int = 0
      
      func deposit(amount: Int) {
          balance += amount
      }
  }
  let account = BankAccount()
  await account.deposit(amount: 100)
  ```

### **5. Structured Concurrency**
- Tasks are arranged in a **hierarchy** (parent-child relationships).
- **Benefits**:
  - Parent tasks **automatically wait** for child tasks.
  - Child tasks inherit parent priorities.
  - Cancelling a parent cancels all child tasks.
  - Task-local values propagate automatically.

### **6. Error Handling in Concurrency**
- Errors in async functions propagate like regular errors.
- Throwing an error inside a task cancels the task’s remaining work.
- **`CancellationError`** is used when tasks are explicitly canceled.
- Example:
  ```swift
  func fetchData() async throws -> String {
      throw CancellationError()
  }
  ```

### **7. Practical Applications**
- Swift’s concurrency model improves performance in tasks like **networking and file handling**, keeping the UI responsive.
- Using structured concurrency ensures **safe, efficient, and predictable** execution of async tasks.
