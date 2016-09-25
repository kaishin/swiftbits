func catchWildPokémon() {
  print("Items")
  print("Poké Ball")
  print("Wash, rinse, repeat.")
}
func catchWildPokémon(ballType: String) {
  print("Items")
  print(ballType)
  print("Wash, rinse, repeat.")
}
func isMasterBall(successPercent: Double) -> Bool {
  return successPercent == 100
}
catchWildPokémon(ballType: "Ultra Ball")
func catchWildPokémon(ballType: String, statusAttack: String) {
  print(statusAttack)
  catchWildPokémon(ballType: ballType)
}
catchWildPokémon(ballType: "Super Ball", statusAttack: "Hypnosis")
func falseSwipe(currentHP: Double) -> (remainingHP: Double, damage: Double) {
  let potentialDamage = 67.0
  if potentialDamage >= currentHP {
    return(1, currentHP - 1)
  } else {
    return(currentHP - potentialDamage, potentialDamage)
  }
}
falseSwipe(currentHP: 72)
falseSwipe(currentHP: 20)
func catchWildPokémon(with ballType: String) {
  print("Items")
  print(ballType)
  print("Wash, rinse, repeat.")
}
catchWildPokémon(with: "Speed Ball")
func use(_ move: String) {
  print(move)
}
use("Tackle")
func lazilyCatchWildPokémon(with ballType: String = "Poké Ball") {
  print("Items")
  print(ballType)
  print("Wash, rinse, repeat.")
}
lazilyCatchWildPokémon()
func use(_ moves: String...) {
  for move in moves {
    print(move)
  }
}
use("Tackle", "Leech Seed")
