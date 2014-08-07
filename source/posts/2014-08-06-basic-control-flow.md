---
title: Basic Control Flow
date: 2014-08-06 17:00 CEST
tags: beginner, tutorial
teaser: "This section takes a look at what Swift has to offer in terms of
control flow, an essential part of every programming language. In this first part we
will look at 'if' and 'switch' statements."
---

### Conditional Statements

The `if` statement evaluates a boolean value and executes a code block if it's
`true`:

~~~swift
let elementalType = "Fire"

if elementalType == "Fire" {
  println("Use water!") // <-
}
~~~

With `else`:

~~~swift
if elementalType == "Fairy" {
  println("Use poison!")
} else {
  println("Draco Meteor!") // <-
}
~~~

### Chaining Conditionals

Multiple `if` statements can be chained:

~~~swift
if elementalType == "Fairy" {
  println("Use poison!")
} else if elementalType == "Bug" {
  println("Kill it with fire!")
} else {
  println("Draco Meteor Again.") // <-
}
~~~

### Switch Statements

The `switch` statement evaluates a value against multiple patterns
then executes the code corresponding to the one that matches:

~~~swift
switch elementalType {
case "Fairy":
  println("Use poison!")
case "Bug":
  println("Kill it with fire!")
default:
  println("More Draco Meteor.") // <-
}
~~~

A `switch` statement needs to be exhaustive; every possible value should be
covered. The `default` case covers all the remaining cases.

A single case can check against multiple values:

~~~swift
switch elementalType {
case "Dragon", "Flying", "Grass", "Ground":
  println("Freeze it to death.")
case "Ice":
  println("Melt it with fire!")
default:
  println("Ready for another Draco Meteor?") // <-
}
~~~

### Switch Fall-through

The execution of a `switch` statement stops as soon a case is matched:

~~~swift
let fireType = "Fire"

switch fireType {
case "Fire":
  println("Go, Squirtle!") // <-
default:
  println("Your turn will never come, Pikachu...")
}
~~~

You can also explicitly end execution using the keyword `break` anywhere in the
statement.

### Range Matching

Cases in a `switch` statement can check if a value is included in a range:

~~~swift
let baseAttack = 89

switch baseAttack {
case 1...30:
  println("Jus release it.")
case 31...70:
  println("Meh")
case 71...150:
  println("Now we're talking!") // <-
case 151...200:
  println("Uber!")
default:
  println("Hackemon!")
}
~~~

### Tuple Matching

Tuples can be used as values in `switch` cases. You can ignore a value in the
tuple by replacing it with `_` in the case's test:

~~~swift
let baseSpecialAttack = 55
let baseMixedAttack = (baseAttack, baseSpecialAttack)

switch baseMixedAttack {
case (80...200, 80...200):
  println("Good mixed sweeper.")
case (_, 80...200):
  println("Good special sweeper.")
case (80...200, _):
  println("Good physical sweeper.") // <-
default:
  println("Not competitive enough.")
}
~~~

### Binding Values

Matched values can be bound to constants or variables and reused
inside the case's body:

~~~swift
switch baseMixedAttack {
case (80...200, let specialAttack):
  println("Good physical sweeper with a special attack of \(specialAttack)") // <-
case (let attack, 80...200):
  println("Good special sweeper with an attack of \(attack)")
default:
  println("Not competitive enough.")
}
~~~

### Where

Cases in a `switch` statement can use a `where` clause to perform additional checks:

~~~swift
switch baseMixedAttack {
case let (attack, specialAttack) where attack == specialAttack:
  println("Perfectly balanced attack stats.")
default:
  println("Unbalanced attack stats.")
}
~~~
