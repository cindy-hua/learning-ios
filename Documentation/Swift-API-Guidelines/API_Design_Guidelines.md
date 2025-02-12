# Summary of Learnings: Swift API Design Guidelines

Today, I explored key concepts from the Swift API Design Guidelines and worked on exercises to improve my understanding of writing clear and concise code. Below is a summary of the learnings and practical insights:

## Key Principles

1. **Clarity over Brevity:**
   - Writing clear code is more important than making it short.
   - Every declaration should include a documentation comment.

2. **Clarity in Design:**
   - Reading a declaration alone is insufficient; context is necessary to understand its role.

## Naming Conventions

3. **Avoid Ambiguity:**
   - Include all necessary words to avoid confusion.
   - Omit needless words to keep names concise.

4. **Role-Based Naming:**
   - Name variables, parameters, and associated types based on their roles rather than their type constraints.

5. **Type and Protocol Naming:**
   - Use `UpperCamelCase` for types and protocols.
   - Use `lowerCamelCase` for other identifiers (e.g., variables, methods).

6. **Abbreviations and Acronyms:**
   - Use only well-known abbreviations (e.g., `sin`, `ASCII`).

## Method and Parameter Design

7. **Mutating vs. Non-Mutating Methods:**
   - Use the imperative form for mutating methods (e.g., `increment`).
   - Use participle forms for non-mutating methods (e.g., `incremented`).
   - Prefer "-ing" for non-mutating methods attached to objects (e.g., `adding`).

8. **Parameter Labels:**
   - Design labels to make the method call read like an English sentence.

9. **Default Parameter Values:**
   - Simplify common uses by providing default values.
   - Place default parameters at the end of the parameter list to avoid confusion.

## Practical Exercises

### Documentation Comments
**Before:**
```swift
struct Rectangle {
    var width: Double
    var height: Double

    func area() -> Double {
        return width * height
    }
}
```
**After:**
```swift
struct Rectangle {
    var width: Double
    var height: Double

    /// Computes and returns the area of the rectangle.
    func area() -> Double {
        return width * height
    }
}
```

### Naming Variables and Parameters
**Before:**
```swift
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}
```
**After:**
```swift
func add(_ firstNumber: Int, _ secondNumber: Int) -> Int {
    return firstNumber + secondNumber
}
```

### UpperCamelCase and lowerCamelCase
**Before:**
```swift
struct rectangle {
    var Width: Double
    var Height: Double
}
```
**After:**
```swift
struct Rectangle {
    var width: Double
    var height: Double
}
```

### Avoiding Ambiguity in Naming
**Before:**
```swift
struct Account {
    func withdraw(amount: Double) {
        print("Withdrawn \(amount)")
    }
}
```
**After:**
```swift
struct Account {
    func withdrawMoney(amount: Double) {
        print("Withdrawn \(amount)")
    }
}
```

### Abbreviations and Acronyms
**Before:**
```swift
struct NetworkingMgr {
    func fetchData(url: String) {
        print("Fetching data from \(url)")
    }
}
```
**After:**
```swift
struct NetworkingManager {
    func fetchData(url: String) {
        print("Fetching data from \(url)")
    }
}
```

### Differentiating Mutating and Non-Mutating Methods
**Before:**
```swift
struct Counter {
    var value: Int

    func formIncrement() {
        value += 1
    }
}
```
**After:**
```swift
struct Counter {
    var value: Int

    mutating func increment() {
        value += 1
    }
}
```

### Parameter Labels as English Sentences
**Before:**
```swift
func moveTo(x: Int, y: Int) {
    print("Moving to (\(x), \(y))")
}
```
**After:**
```swift
func move(toX x: Int, toY y: Int) {
    print("Moving to (\(x), \(y))")
}
```

### Default Parameter Values
**Before:**
```swift
func connect(host: String, port: Int, useSSL: Bool) {
    print("Connecting to \(host) on port \(port) with SSL: \(useSSL)")
}
```
**After:**
```swift
func connect(host: String, port: Int = 80, useSSL: Bool = false) {
    print("Connecting to \(host) on port \(port) with SSL: \(useSSL)")
}
```

---
