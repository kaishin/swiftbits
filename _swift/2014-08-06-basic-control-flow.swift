let wildPokémonType = "Bug"
if wildPokémonType == "Bug" {
  print("Go! Charmander!")
}
if wildPokémonType == "Rock" {
  print("Leech Seed")
} else {
  print("Tackle")
}
if wildPokémonType == "Water" {
  print("Leech Seed")
} else if wildPokémonType == "Bug" {
  print("Come back, Bulbasaur!")
} else {
  print("Tackle")
}
switch wildPokémonType {
case "Water":
  print("Go! Bulbasaur!")
case "Bug":
  print("Go! Charmander!")
default:
  print("Go! Pikachu!")
}
switch wildPokémonType {
case "Rock", "Fire":
  print("Go! Squirtle!")
case "Bug", "Plant":
  print("Go! Charmander!")
default:
  print("Go! Pikachu!")
}
let someType = "Fire"
switch someType {
case "Fire":
  print("Go, Squirtle!")
default:
  print("Pikachu will not be sent out this round.")
}
let baseAttack = 89
switch baseAttack {
case 1...70:
  print("This pokémon is useless. Set it free.")
case 71...150:
  print("Now we're talking.")
case 151...200:
  print("Uber!")
default:
  print("Hackemon!")
}
let baseSpecialAttack = 55
var baseMixedAttack = (baseAttack, baseSpecialAttack)
switch baseMixedAttack {
case (80...200, 80...200):
  print("Good mixed sweeper.")
case (_, 80...200):
  print("Good special sweeper.")
case (80...200, _):
  print("Good physical sweeper.")
default:
  print("Not competitive enough.")
}
switch baseMixedAttack {
case (80...200, let specialAttack):
  print("Good physical sweeper with a special attack of \(specialAttack)")
case (let attack, 80...200):
  print("Good special sweeper with an attack of \(attack)")
default:
  print("Not competitive enough.")
}
baseMixedAttack.0 = 55
switch baseMixedAttack {
case let (attack, specialAttack) where attack == specialAttack:
  print("Perfectly balanced attack stats.")
default:
  print("Unbalanced attack stats.")
}
