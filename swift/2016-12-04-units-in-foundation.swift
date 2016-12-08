import Foundation
let snorlaxWeight = Measurement(value: 460, unit: UnitMass.kilograms)
let snorlaxWightInImperial = snorlaxWeight.converted(to: .pounds)
extension UnitMass {
  static let snorlax = UnitMass(symbol: "snorlax", converter: UnitConverterLinear(coefficient: 460))
}
UnitMass.baseUnit()
let statueOfLibertyMass = Measurement(value: 225_000, unit: UnitMass.kilograms)
let statueOfLibertyMassInSnorlax = statueOfLibertyMass.converted(to: .snorlax)
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
