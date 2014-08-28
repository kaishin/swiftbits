---
title: Function Basics
tags: beginner, tutorial
teaser: "Functions are an essential part of most modern programming languages. Let's look at what Swift has to offer."
---

### Defining Functions

A function is a stand-alone set of instructions that can be reused to achieve
the same task in different parts of the program.

In Swift, functions are defined using the `func` keyword, followed by the
function name, its parameters, then its return type. Both parameters and the return
type can be omitted if the function takes no parameters and returns no value:

~~~swift
func quarterCircleForward() {
  println("Down")
  println("Down-forward")
  println("Forward")
}
~~~

Parameters, if present, should be named and type-labeled inside the parentheses
following the function's name:

~~~swift
func quarterCircle(direction: String) {
  println("Down")
  println("Down-\(direction.lowercaseString)")
  println(direction)
}
~~~

~~~swift
quarterCircle("Forward") // Prints same output as previous function
~~~

If the function returns a value, the type of the latter should be specified after the closing parenthesis of the parameters, preceded by a `->` (*return arrow*) sign:

~~~swift
func canPerformSuperCombo(gauge: Float) -> Bool {
  return gauge == 1.0
}
~~~

### Calling Functions

To call a function, use its name followed immediately by parentheses containing any required
parameters. The parentheses can't be omitted even in the absence of required
parameters:

~~~swift
canPerformSuperCombo(0.8) // -> false
~~~

### Multiple Parameters

Multiple parameters should be separated by commas:

~~~swift
func canPerformShinkuHadoken(gauge: Float, name: String) -> Bool {
  if name == "Ryu" || name == "Sakura" {
    return canPerformSuperCombo(gauge)
  } else {
    return false
  }
}
~~~

~~~swift
canPerformShinkuHadoken(1.0, "Ryu") // -> true
~~~

### Multiple Return Values

Functions can also return [tuples](http://learn-swift.co/#tuples):

~~~swift
func canPerformUltraCombo(revengeGauge: Float) -> (Bool, damageMultiplier: Float) {
  if revengeGauge >= 0.5 {
    if revengeGauge == 1.0 {
      return (true, 1.5)
    } else {
      return (true, 1.0)
    }
  } else {
    return (false, 0)
  }
}
~~~

~~~swift
canPerformUltraCombo(0.6) // -> (true, 1.0)
~~~

### External Parameter Names

In the `quarterCircle(direction: String)` function above, `direction` is only
used within the function, not in its call signature. For more clarity of intent,
you can provide an external name for each parameter by placing it before its
internal one:

~~~swift
func quarterCircle(relativeDirection direction: String) {
  println("Down")
  println("Down-\(direction.lowercaseString)")
  println(direction)
}
~~~

~~~swift
quarterCircle(relativeDirection: "Backward")
~~~

Notice how the parameter name is now part of the function's signature.

If you want to use the same value for both internal and external names, you can
use the `#` shortcut notation:

~~~swift
func canPerformSuperCombo(#gauge: Float) -> Bool {
  return gauge == 1.0
}
~~~

~~~swift
canPerformSuperCombo(gauge: 0.5)
~~~

### Default Parameter Values

You can assign default values to your function parameters:

~~~swift
func quarterCircle(direction: String = "Forward") {
  println("Down")
  println("Down-\(direction.lowercaseString)")
  println(direction)
}
~~~

~~~swift
quarterCircle() // Called without argument
~~~

### Variadic Parameters

Functions can take an arbitrary number of arguments of the same type, called variadic
parameters. Variadic parameters use `...` after their type label in the function
definition:

~~~swift
func directionalInput(directions: String...) {
  for direction in directions {
    println(direction)
  }
}
~~~

~~~swift
directionalInput("Down", "Up") // Prints "Down", "Up"
~~~




