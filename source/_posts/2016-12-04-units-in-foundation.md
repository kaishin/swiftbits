---
title: "Units in Foundation"
date: 2016-12-04 06:55:50 +0100
tags:
  - swift3
  - foundation
  - measurments
  - dimension
category: basics
code: true
---

Starting iOS 10 and macOS 10.12, *Foundation* supports units and measurments out of the box, in the form of [(NS)Unit][unit] and [(NS)Measurment][measurment] respectively.

To get started, let's import `Foundation`:

~~~swift
import Foundation
~~~

To define a measurment, a *value* and a *unit* are needed:

~~~swift
let snorlaxWeight = Measurement(value: 460, unit: UnitMass.kilograms)
// -> 460.0 kg
~~~

You can then effortlessly convert the measurment to another unit:

~~~swift
let snorlaxWightInImperial = snorlaxWeight.converted(to: .pounds)
// -> 1014.12723328454 lb
~~~

You can also define your own unit by extending one of the default [*dimensions*][dimensions] available:

~~~swift
extension UnitMass {
  static let snorlax = UnitMass(symbol: "snorlax", converter: UnitConverterLinear(coefficient: 460))
}
~~~

The converter is used to transform the measurment from any given unit to the base unit of the dimension; Kilograms in the case of `UnitMass`. You can inspect the base unit of any dimension by calling `baseUnit()` on it.

~~~swift
UnitMass.baseUnit()
// -> kg
~~~

Once defined, your custom unit can be used alongside the pre-defined ones:

~~~swift
let statueOfLibertyMass = Measurement(value: 225_000, unit: UnitMass.kilograms)
let statueOfLibertyMassInSnorlax = statueOfLibertyMass.converted(to: .snorlax)
// -> 489.130434782609 snorlax
~~~

You can also define a custom dimension of units by subclassing `Dimension` if necessary. Here is an example that defines a new `UnitDataRate` class for measuring data transfer rates, often used in Internet speed tests:

~~~swift
class UnitDataRate: Dimension {
  static let kilobitPerSecond = UnitDataRate(symbol: "kbps", converter: UnitConverterLinear(coefficient: 1))
  static let megabitPerSecond = UnitDataRate(symbol: "Mbps", converter: UnitConverterLinear(coefficient: 1_000))
  static let gigabitPerSecond = UnitDataRate(symbol: "Gbps", converter: UnitConverterLinear(coefficient: 1_000_000))

  override class func baseUnit() -> UnitDataRate {
    return .megabitPerSecond
  }
}

let speed = Measurement(value: 100, unit: UnitDataRate.megabitPerSecond)
let speedInKpbs = speed.converted(to: .kilobitPerSecond)

// -> 100000 kbps
~~~

### Learn More

- [WWDC session 238](https://developer.apple.com/videos/play/wwdc2016/238/)
- [Measurements and Units in Foundation](https://oleb.net/blog/2016/07/measurements-and-units/) by Ole Begemann.
- [iOS 10: Measurements & Units Screencast](https://videos.raywenderlich.com/screencasts/ios-10-measurements-units) by Sam Davies.

<img src="/images/snorlax.png" title="A wild Snorlax appears!" width="28" height="28" style="border: none; opacity: 0.7; box-shadow: none; margin: 0;">

[unit]: https://developer.apple.com/reference/foundation/unit
[measurment]: https://developer.apple.com/reference/foundation/nsmeasurement
[dimensions]: https://developer.apple.com/reference/foundation/dimension
