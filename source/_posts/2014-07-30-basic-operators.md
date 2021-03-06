---
title: "Basic Operators"
date: 2014-07-30 17:45 +0200
category: basics
tags:
  - beginner
  - pokémon
teaser: "Operators are symbols that are used to modify or inspect values. Let's backtrack a bit and have a look at some basic ones in Swift."
code: true
---

### Assignment Operator

The assignment operator (`=`) is used either to initialize a value regardless of its type, or update it if it was declared as a variable.

~~~swift
let pokémon = "Caterpie"
let wildPokémon = pokémon
wildPokémon
// -> Caterpie
~~~

The assignment operator does not return a value.

### Arithmetic Operators

Swift comes with all the arithmetic operators you would expect in a modern programming language.

~~~swift
35 + 10
// -> 45
35 - 10
// -> 25
10 * 2
// -> 20
10 / 3
// -> 3
~~~

The addition operator can also be used to concatenate two or more strings:

~~~swift
let cityName = "Viridian" + " " + "City"
// -> Viridian City
~~~

Or arrays:

~~~swift
let moves = ["String Shot", "Tackle"]
let moreMoves = ["Harden"]
var moveSet = moves + moreMoves
// -> ["String Shot", "Tackle", "Harden"]
~~~

### Range Operators

Range operators allow you to express a range of a values using lower and upper bounds. They come in two flavors.

The *closed range operator* includes the value corresponding to the upper bound:

~~~swift
let closedRange = moves[0...1]
// -> ["String Shot", Tackle"]
~~~

The *half-closed* range operator omits the value corresponding to the upper bound:

~~~swift
let halfClosedRange = moves[0..<1]
// -> ["String Shot"]
~~~

### Remainder Operator

The remainder operator (`%`) outputs the remainder of a division of two numbers:

~~~swift
let remainder = 10 % 3
// -> 1
~~~

It also works with negative numbers:

~~~swift
let negativeRemainder = 35 % -15
// -> 5
~~~

For decimals, you will have to make sure that both number are of type `Float` or `Double`:

~~~swift
Float(10).truncatingRemainder(dividingBy: 3.5)
// -> 3
~~~

### Compound Assignment Operators

These operators execute an operation and assign the result to the left operand at the same time:

~~~swift
var remainingHP = 35
remainingHP += 10
// -> 45 (remainingHP = remainingHP + 10)
remainingHP -= 10
// -> 35 (remainingHP = remainingHP - 10)
remainingHP *= 2
// -> 70 (remainingHP = remainingHP * 2)
remainingHP /= 2
// -> 35 (remainingHP = remainingHP / 2)
remainingHP %= 6
// -> 5 (remainingHP = remainingHP % 6)
~~~

### Comparison Operators

Comparison operators are binary operators that compare two values and return a boolean:

~~~swift
35 == 35
// -> true (is equal)
180 != 35
// -> true (is not equal)

180 > 35
// -> true (is greater than)
35 < 180
// -> true (is less than)

35 >= 35
// -> true (is greater than or equal)
180 <= 35
// -> false (is less than or equal)
~~~

### Logical Operators

Swift has three logical operators that all return a boolean value:

- The NOT operator (`!value`) inverts a boolean value.
- The AND operator (`value1 && value2`) returns `true` if all values are `true`.
- The OR operator (`value1 || value2`) returns `true` if at least one value is `true`.

~~~swift
var damage = 56
var lastPokemon = true
var oneHitKO = (damage > remainingHP)
// -> true

let notOneHitKO = !oneHitKO
// -> false
let andOperator = notOneHitKO && lastPokemon
// -> false
let orOperator = notOneHitKO || lastPokemon
// -> true
~~~
