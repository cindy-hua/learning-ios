
# Swift Basic Operators - Learning Notes

## Key Concepts Learned

### Types of Operators
- **Unary Operators**:
  - Operate on a single target.
  - Examples: Negation (`-a`), Boolean NOT (`!b`), Force Unwrapping (`c!`).
- **Binary Operators**:
  - Operate on two targets.
  - Examples: Addition (`2 + 3`), String concatenation (`"Hello" + " World"`).
- **Ternary Operators**:
  - Operate on three targets.
  - Example: Ternary conditional (`a ? b : c`).

### Tuple Comparison
- Tuples are compared element by element, from left to right:
  ```swift
  (1, "zebra") < (2, "apple") // true (1 < 2)
  (3, "apple") < (3, "bird") // true ("apple" < "bird")
  (4, "dog") == (4, "dog")  // true
  ```
- Only tuples with the same number of elements can be compared.

### Short-Circuit Evaluation
- Logical operators (`&&`, `||`) use short-circuit evaluation:
  - In `a != nil ? a! : b`, if `a` is not `nil`, the expression `b` is not evaluated.
  - Improves efficiency by avoiding unnecessary evaluations.

### One-Sided Ranges
- Used to specify a range of elements in an array:
  ```swift
  names[2...]  // From index 2 to the end
  names[...2]  // From the beginning to index 2
  ```
- Useful for slicing arrays and iterating over a subset of elements.

### Logical Operators
- Logical operators are **left-associative**:
  - Example: `true && false || true`
    - Evaluated as `(true && false) || true`.
- Ensures predictable evaluation order without parentheses.
