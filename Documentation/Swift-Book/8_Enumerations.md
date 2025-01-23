
# Swift Enumerations - Learning Notes

## Key Concepts Learned

### Definition of Enumerations
- An enumeration (enum) in Swift is a custom type that defines a list of possible values.
- Unlike enums in languages like C or Objective-C, Swift enums:
  - Are more flexible.
  - Do not require assigning raw values to each case.
  - Can store associated values.

### Declaring Enums
- Syntax for declaring an enumeration:
  ```swift
  enum EnumName {
      case caseOne
      case caseTwo
      case caseN
  }
  ```
- Example:
  ```swift
  enum CompassDirection {
      case north
      case south
      case east
      case west
  }
  ```

### Associated Values
- Associated values allow enums to store additional information alongside each case.
- Example:
  ```swift
  enum Barcode {
      case upc(Int, Int, Int, Int)
      case qrCode(String)
  }

  var productCode = Barcode.upc(8, 85909, 51226, 3)
  productCode = .qrCode("ABCDEFGHIJ")
  ```
- To access associated values, use a `switch` statement:
  ```swift
  switch productCode {
  case .upc(let numberSystem, let manufacturer, let product, let check):
      print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
  case .qrCode(let code):
      print("QR Code: \(code)")
  }
  ```

### Raw Values
- Raw values are fixed, predefined values for each case in an enum.
- Raw values can be of types: `Int`, `String`, `Character`, or `Double`.
- Example:
  ```swift
  enum Planet: Int {
      case mercury = 1, venus, earth, mars
  }

  let planet = Planet(rawValue: 3)
  print(planet) // Optional(Planet.earth)
  ```
- Raw values differ from associated values because they are the same for every instance of a specific case.

### Switch Statements with Enums
- Switch statements are commonly used with enums to handle all possible cases.
- The compiler enforces exhaustive handling of enum cases.
- Example:
  ```swift
  let direction = CompassDirection.north

  switch direction {
  case .north:
      print("Heading North")
  case .south:
      print("Heading South")
  case .east:
      print("Heading East")
  case .west:
      print("Heading West")
  }
  ```

### Recursive Enumerations
- A recursive enum is an enum where a case can store an instance of the enum itself as an associated value.
- Use the `indirect` keyword to enable recursion.
- Example:
  ```swift
  enum ArithmeticExpression {
      case number(Int)
      indirect case addition(ArithmeticExpression, ArithmeticExpression)
      indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
  }

  let five = ArithmeticExpression.number(5)
  let four = ArithmeticExpression.number(4)
  let sum = ArithmeticExpression.addition(five, four)
  let product = ArithmeticExpression.multiplication(sum, five)
  ```
