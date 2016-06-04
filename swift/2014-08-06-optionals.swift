var heldItem: String? 
heldItem = "Life Orb"
heldItem = nil
heldItem == nil
if heldItem == nil {
  print("No held items.")
}
heldItem = "Life Orb"
print("You knocked off the foe's Caterpie's \(heldItem!)!")
if let itemName = heldItem {
  print("Knock off the \(itemName)")
}
let move: String? = "Knock off"
if let itemName = heldItem, let moveName = move {
  print("\(moveName) the \(itemName)")
}
var implicitlyUnwrappedItemName: String! = "Berry"
print("Wild Vulpix always carry a \(implicitlyUnwrappedItemName)")
let staryuHeldItemRates: [String: Float]? = ["Stardust": 0.5, "Star Piece": 0.05]
// staryuHeldItemRates.isEmpty
staryuHeldItemRates?.isEmpty
var preferredHeldItem: String? = "Leftovers"
var itemToHold = preferredHeldItem ?? "Life Orb"
preferredHeldItem = nil
itemToHold = preferredHeldItem ?? "Life Orb"
