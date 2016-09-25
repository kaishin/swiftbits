let pokémon = "Caterpie"
let wildPokémon = pokémon
wildPokémon
35 + 10
35 - 10
10 * 2
10 / 3
let cityName = "Viridian" + " " + "City"
let moves = ["String Shot", "Tackle"]
let moreMoves = ["Harden"]
var moveSet = moves + moreMoves
let closedRange = moves[0...1]
let halfClosedRange = moves[0..<1]
let remainder = 10 % 3
let negativeRemainder = 35 % -15
Float(10).truncatingRemainder(dividingBy: 3.5)
var remainingHP = 35
remainingHP += 10
remainingHP -= 10
remainingHP *= 2
remainingHP /= 2
remainingHP %= 6
35 == 35
180 != 35
180 > 35
35 < 180
35 >= 35
180 <= 35
var damage = 56
var lastPokemon = true
var oneHitKO = (damage > remainingHP)
let notOneHitKO = !oneHitKO
let andOperator = notOneHitKO && lastPokemon
let orOperator = notOneHitKO || lastPokemon
