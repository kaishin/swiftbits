---
title: Dictionaries
tags: beginner, tutorial
teaser: "In this section, we'll take a look at Swift dictionaries."
---

### Declaring Dictionaries

Dictionaries hold a collection of key and value pairs. Like arrays, they can be
declared using the bracket shorthand syntax:

~~~swift
var bossNames = ["Emerald Hill": "Mecha", "Chemical Plant": "Water", "Aquatic Ruin": "Hammer"]
~~~

To explicitly set the type of a dictionary, you can use the `[Type: Type]`
syntax:

~~~swift
var moreBossNames: [String: String] = [:]
~~~

All keys must be of the same type. The same applies for values:

~~~swift
var bossNames: [String: String] = ["Emerald Hill": "Drill", 2: "Water"] // -> Error
~~~

### Inspecting Dictionaries

You can get the number of key/value pairs in a dictionary using `count`:

~~~swift
bossNames.count // -> 3
~~~

To check whether a dictionary is empty, you can use the `isEmpty()` function:

~~~swift
bossNames.isEmpty // -> false
~~~

### Getting Dictionary Values

Like arrays, you can use subscript syntax to retrieve the value[^1] corresponding to
a given key.

~~~swift
bossNames["Chemical Plant"] // -> "Water"
~~~

### Adding to a Dictionary

To add a new key/value pair, use the subscript operator:

~~~swift
moreBossNames["Casino Night"] = "Catcher"
moreBossNames // -> ["Casino Night": "Catcher"]
~~~

### Updating Dictionary Values

To update an existing value, use the subscript syntax:

~~~swift
bossNames["Emerald Hill"] = "Drill"
bossNames // -> ["Emerald Hill": "Drill", "Aquatic Ruin": "Hammer", "Chemical Plant": "Water"]
~~~

### Mutating Dictionaries

Mutating the values included in a dictionary requires the latter
to be declared as a variable using the `var` keyword:

~~~swift
let constantBossNames: [String: String] = [:]
constantBossNames["Emerald Hill"] = "Drill" // -> Error
~~~

### Deleting Dictionary Values

To delete an existing key/value pair, make its value `nil`:

~~~swift
bossNames["Chemical Plant"] = nil
bossNames // -> ["Emerald Hill": "Drill", "Aquatic Ruin": "Hammer"]
~~~

[^1]: In practice, what you get is an optional value, which means it can be `nil`. More on that later.
