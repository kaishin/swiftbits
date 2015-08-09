---
title: Dictionaries
tags:
  - beginner
  - tutorial
  - pokémon
teaser: "In this section, we'll take a look at Swift dictionaries."
swift: 2.0ß4
---

### Declaring Dictionaries

Dictionaries hold a collection of key and value pairs. Like arrays, they can be declared using the bracket shorthand syntax, commonly referred to as a *dictionary literal*:

~~~swift
var routeOneEncounterRates = ["Pidgey": 0.55, "Rattata": 0.45]
~~~

The example above relies on type inference to guess the type of the dictionary. Use the `[Type: Type]` syntax to explicitly set the latter, and `[:]` to create an empty dictionary of said type:

~~~swift
var fishingEncounterRates: [String: Double] = [:]
~~~

It's also possible to create an empty dictionary using type inference like so:

~~~swift
var fishingEncounterRates = [String: Double]()
~~~


All keys must be of the same type. The same applies for values:

~~~swift
routeOneEncounterRates = ["Pidgey": "55%"]
// -> Error
~~~

### Inspecting Dictionaries

You can get the number of key/value pairs in a dictionary using `count`:

~~~swift
routeOneEncounterRates.count
// -> 2
~~~

To check whether a dictionary is empty, you can use the `isEmpty()` function:

~~~swift
routeOneEncounterRates.isEmpty
// -> false
~~~

### Getting Dictionary Values

Like arrays, you can use subscript syntax to retrieve the value[^1] corresponding to
a given key.

~~~swift
routeOneEncounterRates["Rattata"]
// -> 0.45
~~~

### Adding to a Dictionary

To add a new key/value pair, use the subscript syntax:

~~~swift
fishingEncounterRates["Poliwag"] = 0.5
// -> ["Poliwag": 0.5]
~~~

### Updating Dictionary Values

To update an existing value, use the subscript syntax:

~~~swift
routeOneEncounterRates["Mewtwo"] = 0.0
// -> ["Rattata": 0.45, "Mewtwo": 0, "Pidgey": 0.55]
~~~

### Mutating Dictionaries

Mutating the values included in a dictionary requires the latter to be declared as a variable using the `var` keyword:

~~~swift
let pokéMart = ["Poké Ball": 200, "Potion": 300]
pokéMart["Antidote"] = 100
// -> Error
~~~

### Deleting Dictionary Values

To delete an existing key-value pair, make its value `nil`:

~~~swift
routeOneEncounterRates["Mewtwo"] = nil
// -> ["Rattata": 0.45, "Pidgey": 0.55]
~~~

### Comparing Dictionaries

You can compare two dictioanries using the `==` operator:

~~~swift
["Rattata": 0.45, "Pidgey": 0.55] == ["Pidgey": 0.55, "Rattata": 0.45]
// -> true
~~~

Notice how the order of key-value pairs doesn't matter in dictionaries.

[^1]: In practice, what you get is an optional value, which means it can be `nil`. More on that later.
