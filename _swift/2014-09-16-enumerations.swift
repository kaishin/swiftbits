enum StarterType {
  case Grass
  case Fire
  case Water
}
enum PokémonType {
  case Grass, Fire, Water
}
let WaterType = StarterType.Water
var FireType: StarterType = .Fire
let chosenStarterType = StarterType.Water
switch chosenStarterType {
case .Grass, .Water:
  print("Brock, here I come!")
case .Fire:
  print("Wild Caterpies, here I come!")
}
enum Move {
  case Healing(percent: Int)
  case Damage(power: Int)
  case Status(effect: String)
}
let tackle = Move.Damage(power: 50)
switch tackle {
case .Healing(let percentHealed):
  print("Heals \(percentHealed) of the pokémon's HP.")
case .Damage(let basePower):
  print("Deals damage with a base power of \(basePower).")
case .Status(let statusEffect):
  print("A status move that inflicts \(statusEffect).")
}
enum MoveCategory: String {
  case Physical = "Physical Move"
  case Special = "Special Move"
  case Status = "Status Move"
}
var physicalTypeName = MoveCategory.Physical.rawValue
let statusType = MoveCategory(rawValue: "Status Move")
enum RawMoveCategory: String {
  case Physical
  case Special
  case Status
}
physicalTypeName = RawMoveCategory.Physical.rawValue
