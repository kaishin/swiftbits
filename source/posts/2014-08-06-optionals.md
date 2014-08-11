---
title: optionals
date: 2014-08-06 20:55 CEST
tags: beginner, tutorial
teaser: "Optionals are variables or constants that can either have a value or be
nil."
---

### Declaring Optionals

Optionals are variables or constants that can either have a value or be `nil`.
They are defined by appending a `?` at the end of the type in the declaration:

~~~swift
var dropItemName: String? // Enemy may or may not drop item
dropItemName = "Wizard's Relic"
dropItemName = nil // This would have raised an error if the variable wasn't an optional
~~~

### Inspecting Optionals

You can compare the optional against `nil` to find out if it contains a value or
not:

~~~swift
dropItemName == nil // <- true
~~~

This can also be used in `if` statements:

~~~swift
if dropItemName == nil {
  println("Out of luck.") // <-
}
~~~

### Forced Unwrapping

If the optional is guaranteed to contain a value, you can *unwrap* its value using an
exclamation mark at the end of the optional name:

~~~swift
dropItemName = "Elixir"
if dropItemName != nil {
  println("You got an unwrapped \(dropItemName!)") // <-
}
~~~

Unwrapping allows you to directly access the value contained in the optional.

### Optional Binding

You can also bind a variable or a constant to the value contained in an
optional in an `if` or `while` statement:

~~~swift
if let itemName = dropItemName {
  println("This is undoubtedly an \(itemName)")
}
~~~

### Implicit Unwrapping

If an optional is guaranteed to *always* contain a value, it can be declared as an
*implicitly unwrapped optional* by appending an exclamation mark to its type in
the definition:

~~~swift
var implicitlyUnwrappedItemName: String! = "Omega Arts"
println("\(implicitlyUnwrappedItemName) is a certain drop.")
~~~

Using this method, you don't have to append `!` to unwrap the value contained in
the optional; it will be implicitly unwrapped for you.

### Optional Chaining

You can use *optional chaining* to call a method on an optional. In order to do
so, append a question mark to the name of the optional, just before the dot
preceding the method name:

~~~swift
let dropRates: [String: Float]? = ["Wizard's Relic": 0.002, "Shiny Crystal": 0.2, "Ether": 0.2]
dropRates.isEmpty // -> Error
dropRates?.isEmpty // -> false
~~~

Optional chaining can also be used to get/set properties, which will be
introduced later.

### Nil Coalescing Operator

The *nil coalescing operator* `??` is used to unwrap an optional if it's not
`nil` or return a default value otherwise:

~~~swift
let weaponOfChoice: String? = "One Winged Angel"
let currentWeapon = weaponOfChoice ?? "Kingdom Key"
currentWeapon // -> "One Winged Angel"

let shieldOfChoice: String? = nil
let currentShield = shieldOfChoice ?? "Knight's Shield"
currentShield // -> "Knight's Shield"
~~~
