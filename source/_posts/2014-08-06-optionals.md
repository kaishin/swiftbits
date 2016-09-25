---
title: "Optionals"
date: 2014-08-06 20:55 +0200
category: tutorials
tags:
  - beginner
  - pokémon
teaser: "Optionals are variables or constants that can either have a value or be nil."
---

### Declaring Optionals

Optionals are variables or constants that can either have a value or be `nil` (or `.None` for the picky among you). They are defined by appending a `?` at the end of the type in the declaration:

~~~swift
var heldItem: String? // Pokémon may or may not be holding an item
heldItem = "Life Orb"
// -> "Life Orb"
heldItem = nil
// -> nil
~~~

### Inspecting Optionals

You can compare the optional against `nil` to find out if it contains a value or not:

~~~swift
let isNil = heldItem == nil
// -> true
~~~

This can also be used in `if` statements:

~~~swift
if heldItem == nil {
  print("No held items.")
}
// -> No held items.
~~~

### Forced Unwrapping

If the optional is guaranteed to contain a value, you can *unwrap* its value using an exclamation mark at the end of its name:

~~~swift
heldItem = "Life Orb"

print("You knocked off the foe's Caterpie's \(heldItem!)!")
// -> You knocked off the foe's Caterpie's Life Orb
~~~

Unwrapping allows you to directly access the value contained in the optional.

### Optional Binding

You can also bind a variable or a constant to the value contained in an optional in an `if` or `while` statement:

~~~swift
if let itemName = heldItem {
  print("Knock off the \(itemName)")
}
// -> Knock off the Life Orb
~~~

Starting Swift 1.2, it became possible to bind more than one optional in the same declaration:

~~~swift
let move: String? = "Knock off"

if let itemName = heldItem, let moveName = move {
  print("\(moveName) the \(itemName)")
}
// -> Knock off the Life Orb
~~~

### Implicit Unwrapping

If an optional is guaranteed to *always* contain a value, it can be declared as an *implicitly unwrapped optional* by appending an exclamation mark to its type in the definition:

~~~swift
var implicitlyUnwrappedItemName: String! = "Berry"
print("Wild Vulpix always carry a \(implicitlyUnwrappedItemName)")
// -> "Wild Vulpix always carry a Berry"
~~~

Using this method, you don't have to append `!` to unwrap the value contained in the optional; it will be implicitly unwrapped for you.

### Optional Chaining

You can use *optional chaining* to call a method on an optional. In order to do so, append a question mark to the name of the optional, just before the dot preceding the method name:

~~~swift
let staryuHeldItemRates: [String: Float]? = ["Stardust": 0.5, "Star Piece": 0.05]
staryuHeldItemRates.isEmpty
// -> Error
staryuHeldItemRates?.isEmpty
// -> false
~~~

Optional chaining can also be used to get/set properties, which will be introduced later.

### Nil Coalescing Operator

The *nil coalescing operator* `??` is used to unwrap an optional if it's not `nil` or return a default value otherwise:

~~~swift
var preferredHeldItem: String? = "Leftovers"
var itemToHold = preferredHeldItem ?? "Life Orb"
// -> "Leftovers"

preferredHeldItem = nil
itemToHold = preferredHeldItem ?? "Life Orb"
// -> "Life Orb"
~~~
