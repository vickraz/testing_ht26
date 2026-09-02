extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Enemy.player = $Player #Enemys referens till spelaren sätts
	$Player.connect("dead", _on_player_dead)
	

func _on_player_dead() -> void:
	get_tree().reload_current_scene()
