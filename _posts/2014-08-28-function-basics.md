---
title: "Function Basics"
date: 2014-08-28 20:00:00 +0200
category: learn-swift
tags:
  - beginner
  - tutorial
  - pokémon
teaser: "Functions are an essential part of any modern programming language. Let's look at what Swift has to offer."
swift: 2.0ß4
---

### Defining Functions

A function is a stand-alone set of instructions that can be reused to achieve the same task in different parts of the program.

In Swift, functions are defined using the `func` keyword, followed by the function name, its parameters, then its return type. Both parameters and the return type can be omitted if the function takes no parameters and returns no value:

~~~swift
func catchWildPokémon() {
  print("Items")
  print("Poké Ball")
  print("Wash, rinse, repeat.")
}
~~~

Parameters, if present, should be named and type-labeled inside the parentheses following the function's name:

~~~swift
func catchWildPokémon(ballType: String) {
  print("Items")
  print(ballType)
  print("Wash, rinse, repeat.")
}
~~~

If the function returns a value, the type of the latter should be specified after the closing parenthesis of the parameters, preceded by a `->` (*return arrow*) sign:

~~~swift
func isMasterBall(successPercent: Double) -> Bool {
  return successPercent == 100
}
~~~

### Calling Functions

To call a function, use its name followed immediately by parentheses containing any required parameters. The parentheses can't be omitted even in the absence of required parameters:

~~~swift
catchWildPokémon("Ultra Ball")
// -> Items
// -> Ultra Ball
// -> Wash, rinse, repeat.
~~~

### Multiple Parameters

Multiple parameters should be separated by commas:

~~~swift
func catchWildPokémon(ballType: String, statusAttack: String) {
  print(statusAttack)
  catchWildPokémon(ballType)
}

catchWildPokémon("Super Ball", statusAttack: "Hypnosis")
// -> Hypnosis
// -> Items
// -> Ultra Ball
// -> Wash, rinse, repeat.
~~~

### Multiple Return Values

Functions can also return [tuples]({% post_url 2014-07-28-tuples %}):

~~~swift
func falseSwipe(currentHP: Double) -> (remainingHP: Double, damage: Double) {
  let potentialDamage = 67.0

  if potentialDamage >= currentHP {
    return(1, currentHP - 1)
  } else {
    return(currentHP - potentialDamage, potentialDamage)
  }
}

falseSwipe(72)
// -> (5, 67)
falseSwipe(20)
// -> (1, 19)
~~~

### External Parameter Names

In the `catchWildPokémon(ballType: String) function above, `ballType` is only used within the function, not in its call signature. For more clarity of intent, you can provide an external name for each parameter by placing it before its internal one:

~~~swift
func catchWildPokémon(withBall ballType: String) {
  print("Items")
  print(ballType)
  print("Wash, rinse, repeat.")
}

catchWildPokémon(withBall: "Speed Ball")
// -> Items
// -> Speed Ball
// -> Wash, rinse, repeat.
~~~

Notice how the parameter name is now part of the function's signature.

### Default Parameter Values

You can assign default values to your function parameters:

~~~swift
func lazilyCatchWildPokémon(ballType: String = "Poké Ball") {
  print("Items")
  print(ballType)
  print("Wash, rinse, repeat.")
}

lazilyCatchWildPokémon()
// -> Items
// -> Poké Ball
// -> Wash, rinse, repeat.
~~~


### Variadic Parameters

Functions can take an arbitrary number of arguments of the same type, called variadic parameters. Variadic parameters use `...` after their type label in the function definition:

~~~swift
func useMoves(moves: String...) {
  for move in moves {
    print(move)
  }
}

useMoves("Tackle", "Leech Seed")
// -> "Tackle", "Leech Seed"
~~~
