---
title: "Getting Started"
tags:
 - beginner
teaser: "In this first section, we cover variables, constants, type inference, casting and string interpolation."
date: 2014-12-31 14:56:02
---

### Console Output

~~~swift
println("Hello, Swift.")
~~~

### Variables

Variables are declared using the keyword `var`, followed by the variable name and its type (optional, see [Type Inference](#type-inference)). A value can be assigned to the variable using the `=` operand:

~~~swift
var playerName: String = "Player 1"
~~~

Variables can be re-assigned:

~~~swift
playerName = "Kaishin"
~~~

Variables cannot be `nil`[^1].

~~~swift
playerName = nil // -> Error
~~~

### Constants

Constants are declared similarly to [variables](#variables), except they use the
keyword `let` instead:

~~~swift
let gameTitle: String = "Flappy Swift"
~~~

Constants cannot be re-assigned:

~~~swift
gameTitle = "Swift Valley" // -> Error
~~~

Like variables, constants cannot be `nil`[^1].

### Type Inference

Type inference refers to the compiler's ability
to implicitly determine the type of a variable without having to
specify it in the declaration:

~~~swift
var opponentName = "Player 2"
~~~

### String Interpolation

Values can be included in strings using a `\` and the desired value between
parentheses:

~~~swift
var numberOfLives = 99
var livesLabel = "You have \(numberOfLives - 1) lives remaining."
// -> "You have 98 lives remaining."
~~~

[^1]: Variables and constants that are explicitly declared as optional can be `nil`. More on that later.
