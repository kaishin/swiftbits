var starters = ["Bulbasaur", "Charmander", "Squirtle"]
var legendaries: [String] = []
// var starters = ["Bulbasaur", 2, "Squirtle"]
var items = [String](count: 3, repeatedValue: "Potion")
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
starters.insert("Pikachu", atIndex: 3)
starters[5] = "Mewtwo"
starters.removeAtIndex(5)
starters.removeLast()
starters.removeRange(3...4)
