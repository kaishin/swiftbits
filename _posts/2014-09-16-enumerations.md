---
title: "Enumerations"
date: 2014-09-16 20:00:00 +0200
category: learn-swift
tags:
  - beginner
  - tutorial
  - pokémon
teaser: "This section explores Enumerations in Swift and what makes them more powerful and flexible than their Objective-C counterparts."
---

### Defining Enumerations

Enumerations, also commonly referred to as *enums*, are a data type that holds a set of named, mutually exclusive values.

Enumerations are declared using the `enum` keyword, with each member preceded by the `case` keyword:

~~~swift
enum StarterType {
  case Grass
  case Fire
  case Water
}
~~~

The elements can also be declared in the same line:

~~~swift
enum PokémonType {
  case Grass, Fire, Water
}
~~~

Use dot syntax to declare a variable or constant enumeration value:

~~~swift
let WaterType = StarterType.Water
~~~

If you explicitly set the type of the variable or constant, you can omit the enumeration name in the right-hand side of the assignment:

~~~swift
var FireType: StarterType = .Fire
~~~

### Switching on Enumeration Values

Enumerations are commonly used in `switch` statements:

~~~swift
let chosenStarterType = StarterType.Water

switch chosenStarterType {
case .Grass, .Water:
  print("Brock, here I come!")
case .Fire:
  print("Wild Caterpies, here I come!")
}
// -> Brock, here I come!
~~~

### Associated Values

Enumeration members can hold associated values of any type. The type of the associated value should be specified in the enumeration declaration:

~~~swift
enum Move {
  case Healing(percent: Int)
  case Damage(power: Int)
  case Status(effect: String)
}

let tackle = Move.Damage(power: 50)
~~~

You can check the associated value of an enumeration using a `switch` statement:

~~~swift
switch tackle {
case .Healing(let percentHealed):
  print("Heals \(percentHealed) of the pokémon's HP.")
case .Damage(let basePower):
  print("Deals damage with a base power of \(basePower).")
case .Status(let statusEffect):
  print("A status move that inflicts \(statusEffect).")
}
// -> Deals damage with a base power of 50.
~~~

### Raw Values

Beside associated values, enumeration members can also hold default—or raw—values. Unlike associated values, each member has always the same raw value that's specified when the enumeration is declared. To get the raw value of an enumeration member, use `rawValue`:

~~~swift
enum MoveCategory: String {
  case Physical = "Physical Move"
  case Special = "Special Move"
  case Status = "Status Move"
}

var physicalTypeName = MoveCategory.Physical.rawValue
// -> "Physical Move"
~~~

To get an enumeration member from a raw value, use `MoveCategory(rawValue: String)`:

~~~swift
let statusType = MoveCategory(rawValue: "Status Move")
// -> .Status
~~~

Raw values can be `String`, `Character`, `Int`, or `Float`/`Double`.
If you declare the raw value type but not explicitly set it in one or more cases, the compiler assigns implicit raw values to said cases.

~~~swift
enum RawMoveCategory: String {
  case Physical
  case Special
  case Status
}

physicalTypeName = RawMoveCategory.Physical.rawValue
// -> "Physical"
~~~

