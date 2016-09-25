var starters = ["Bulbasaur", "Charmander", "Squirtle"]
var legendaries: [String] = []
// var starters = ["Bulbasaur", 2, "Squirtle"]
var items = [String](repeating: "Potion", count: 3)
starters.count
starters.isEmpty
starters.first
starters.last
let isBulbasaurStarter = starters.contains("Bulbasaur")
let isPidgeotStarter = starters.contains("Pidgeot")
// starters.contains(2)
let pokemon = starters[0]
legendaries.append("Articuno")
legendaries.append("Zapdos")
legendaries.append("Moltres")
starters += legendaries
let otherLegendaries: [String] = []
// otherLegendaries("Moltres")
starters.insert("Pikachu", at: 3)
starters[5] = "Mewtwo"
starters.remove(at: 5)
starters.removeLast()
starters.removeSubrange(3...4)
