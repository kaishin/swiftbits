let slowTextSpeed = (1, "Slow")
let fastTextSpeed: (Int, String) = (3, "Fast")
var textSpeed = (value: 2, label: "Medium")
var slowSpeedLabel = slowTextSpeed.1
let (_, fastSpeedLabel) = fastTextSpeed
fastSpeedLabel
let (fastSpeedValue, _) = fastTextSpeed
fastSpeedValue
let speedLabel = textSpeed.label
textSpeed.label = "Fast"
textSpeed.value = 3
