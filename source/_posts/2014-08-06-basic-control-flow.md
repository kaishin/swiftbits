---
title: "Basic Control Flow"
date: 2014-08-06 17:00 +0200
category: basics
tags:
  - beginner
  - pokémon
teaser: "This section takes a look at what Swift has to offer in terms of control flow, an essential part of every programming language. In this first part we will look at 'if' and 'switch' statements."
code: true
---

### Conditional Statements

The `if` statement evaluates a boolean value and executes a code block if it's `true`:

~~~swift
let wildPokémonType = "Bug"

if wildPokémonType == "Bug" {
  print("Go! Charmander!")
}
// -> Go! Charmander!
~~~

With `else`:

~~~swift
if wildPokémonType == "Rock" {
  print("Leech Seed")
} else {
  print("Tackle")
}
// -> Tackle
~~~

### Chaining Conditionals

Multiple `if` statements can be chained:

~~~swift
if wildPokémonType == "Water" {
  print("Leech Seed")
} else if wildPokémonType == "Bug" {
  print("Come back, Bulbasaur!")
} else {
  print("Tackle")
}
// -> Come back, Bulbasaur!
~~~

### Switch Statements

The `switch` statement evaluates a value against multiple patterns then executes the code corresponding to the one that matches:

~~~swift
switch wildPokémonType {
case "Water":
  print("Go! Bulbasaur!")
case "Bug":
  print("Go! Charmander!")
default:
  print("Go! Pikachu!")
}
// -> Go! Charmander!
~~~

A `switch` statement needs to be exhaustive; every possible value should be covered. The `default` case covers all the remaining cases.

A single case can check against multiple values:

~~~swift
switch wildPokémonType {
case "Rock", "Fire":
  print("Go! Squirtle!")
case "Bug", "Plant":
  print("Go! Charmander!")
default:
  print("Go! Pikachu!")
}
// -> Go! Charmander!
~~~

### Switch Fall-through

The execution of a `switch` statement stops as soon a case is matched:

~~~swift
let someType = "Fire"

switch someType {
case "Fire":
  print("Go, Squirtle!")
default:
  print("Pikachu will not be sent out this round.")
}
// -> Go, Squirtle!
~~~

You can also explicitly end execution using the keyword `break` anywhere in the statement.

### Range Matching

Cases in a `switch` statement can check if a value is included in a range:

~~~swift
let attack = 89

switch attack {
case 1...70:
  print("Not ready for competitive play.")
case 71...150:
  print("Now we're talking!")
case 151...200:
  print("Uber territory...")
default:
  print("Hackemon.")
}
// -> Now we're talking!
~~~

### Tuple Matching

Tuples can be used as values in `switch` cases. You can ignore a value in the tuple by replacing it with `_` in the case's test:

~~~swift
var offense = (attack: 90, specialAttack: 55)

switch offense {
case (80...200, 80...200):
  print("Good mixed sweeper.")
case (_, 80...200):
  print("Great special sweeper.")
case (80...200, _):
  print("Great physical sweeper.")
default:
  print("Not competitive enough.")
}
// -> Good physical sweeper.
~~~

### Where

Cases in a `switch` statement can use a `where` clause to perform additional checks:

~~~swift
offense.0 = 55

switch offense {
case let (attack, specialAttack) where attack == specialAttack:
  print("Perfectly balanced attack stats.")
default:
  print("Unbalanced attack stats.")
}
// -> Perfectly balanced attack stats.
~~~
