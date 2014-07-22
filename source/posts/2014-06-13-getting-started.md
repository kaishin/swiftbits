---
title: Getting Started
tags: beginner, tutorial
teaser: "In this first section, we cover variables, constants, type inference, casting and string interpolation."
---

### Console Output

~~~swift
println("Hello, Swift.")
~~~

### Variables

Variables are declared using the keyword `var`, followed by the variable name
and its type (optional, see Type Inference). A value can be assigned to the variable
using the `=` operand.

~~~swift
var playerName: String = "Player 1"
~~~

Variables can be re-assigned:

~~~swift
playerName = "Kaishin"
~~~

Variables cannot be `nil`:

~~~swift
playerName = nil // --> Runtime error
~~~

### Constants

Constants are declared similarly to [variables](#variables), except they use the
keyword `let` instead.

~~~swift
let gameTitle: String = "Flappy Swift"
~~~

Constants cannot be re-assigned:

~~~swift
gameTitle = "Swift Valley" // --> Runtime error
~~~

Like variables, constants cannot be `nil`.

### Type Inference

Type inference refers to the compiler's ability
to implicitly determine the type of a variable without having to
specify it in the declaration.

~~~swift
var opponentName = "Player 2"
~~~

### Type Casting

Values can be converted to another type by creating a new instance of the
desired type.

~~~swift
var numberOfLives = 99
let label = "Lives remaining: "
var livesLabel = label + String(numberOfLives)
~~~

### String Interpolation

Values can be included in strings using a `\` and the desired value between
parentheses.

~~~swift
livesLabel = "You have \(numberOfLives - 1) lives remaining."
~~~
