---
title: Getting Started
tags: beginner, tutorial
---

### Console Output

~~~ruby
println("Swift is Apple's new programming language for writing iOS and OSX apps.
It was introduced during WWDC 2014 as a replacement to Objective-C.")
~~~

### Variables

Variables are declared using the keyword `var`, followed by the variable name
and its type (optional, see Type Inference). A value can be assigned to the variable
using the `=` operand.

~~~ruby
var playerName: String = "Player 1"
~~~

Variables can be re-assigned:

~~~ruby
playerName = "Kaishin"
~~~

Variables cannot be `nil`:

~~~javascript
playerName = nil // Runtime error
~~~

### Constants

Constants are declared similarly to [variables](#variables), except they use the
keyword `let` instead.

~~~ruby
let gameTitle: String = "Flappy Swift"
~~~

Constants cannot be re-assigned:

~~~javascript
gameTitle = "Swift Valley" // Runtime error
~~~

Like variables, constants cannot be `nil`.

### Type Inference

Type inference refers to the compiler's ability
to implicitly determine the type of a variable without having to
specify it in the declaration.

~~~ruby
var opponentName = "Player 2"
~~~

### Type Casting

Values can be converted to another type by creating a new instance of the
desired type.

~~~ruby
var numberOfLives = 99
let label = "Lives remaining: "
var livesLabel = label + String(numberOfLives)
~~~

### String Interpolation

Values can be included in strings using a `\` and the desired value between
parentheses.

~~~ruby
livesLabel = "You have \(numberOfLives - 1) lives remaining."
~~~

