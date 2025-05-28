extends Label

var coins_collected = 0

# Update text
func _process(_delta: float) -> void:
	text = str(coins_collected)
