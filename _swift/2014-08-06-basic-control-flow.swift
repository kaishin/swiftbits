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
let attack = 89
switch attack {
case 1...70:
  print("Not ready for competitive play.")
case 71...150:
  print("Now we're talking!")
case 151...200:
  print("Uber territory...")
default:
  print("Hackemon.")
}
var offense = (attack: 90, specialAttack: 55)
switch offense {
case (80...200, 80...200):
  print("Good mixed sweeper.")
case (_, 80...200):
  print("Great special sweeper.")
case (80...200, _):
  print("Great physical sweeper.")
default:
  print("Not competitive enough.")
}
offense.0 = 55
switch offense {
case let (attack, specialAttack) where attack == specialAttack:
  print("Perfectly balanced attack stats.")
default:
  print("Unbalanced attack stats.")
}
