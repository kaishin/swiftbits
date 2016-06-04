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
catchWildPokémon("Ultra Ball")
func catchWildPokémon(ballType: String, statusAttack: String) {
  print(statusAttack)
  catchWildPokémon(ballType)
}
catchWildPokémon("Super Ball", statusAttack: "Hypnosis")
func falseSwipe(currentHP: Double) -> (remainingHP: Double, damage: Double) {
  let potentialDamage = 67.0
  if potentialDamage >= currentHP {
    return(1, currentHP - 1)
  } else {
    return(currentHP - potentialDamage, potentialDamage)
  }
}
falseSwipe(72)
falseSwipe(20)
func catchWildPokémon(withBall ballType: String) {
  print("Items")
  print(ballType)
  print("Wash, rinse, repeat.")
}
catchWildPokémon(withBall: "Speed Ball")
func lazilyCatchWildPokémon(ballType: String = "Poké Ball") {
  print("Items")
  print(ballType)
  print("Wash, rinse, repeat.")
}
lazilyCatchWildPokémon()
func useMoves(moves: String...) {
  for move in moves {
    print(move)
  }
}
useMoves("Tackle", "Leech Seed")
