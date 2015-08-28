---
title: "Basic Operators"
date: 2014-07-30 17:45 +0200
category: learn-swift
tags:
  - beginner
  - tutorial
  - pokémon
teaser: "Operators are symbols that are used to modify or inspect values. Let's backtrack a bit and have a look at some basic ones in Swift."
swift: 2.0ß4
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
"Viridian" + " " + "City"
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
10 % 3
// -> 1
~~~

It also works with floats and negative numbers:

~~~swift
35 % -15
// -> 5
10 % 3.5
// -> 3.0
~~~

### Compound Assignment Operators

These operators execute an operation and assign the result to
the left operand at the same time:

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

### Unary Operators

Swift has all the unary operators that are common in other languages:

~~~swift
remainingHP = 35
++remainingHP
// -> 36
--remainingHP
// -> 35

let damageToKO = -remainingHP
// -> -35
+damageToKO
// -> -35
~~~

Note that the unary *plus* operator is just syntactic sugar and does not change the value it was prepended to.

If the increment or decrement operators are appended as postfix operators (`value++`), the variable is modified *after* its value is returned:

~~~swift
let stepOne = remainingHP
// -> 35
let stepTwo = remainingHP--
// -> 35
let stepThree = remainingHP
// -> 34
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

!oneHitKO
// -> false
!oneHitKO && lastPokemon
// -> false
!oneHitKO || lastPokemon
// -> true
~~~
