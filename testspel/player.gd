extends CharacterBody2D
class_name Player

#Signal för att meddela ett annat skript att spelaren är död
signal dead

const MAX_SPEED = 400
const ACC = 3000

#Godots spelloop: anropas automatiskt av spelmotorn 60ggr/sekund.
func _physics_process(delta: float) -> void:
	
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	#velocity är en egenskap som tillhör Characterbody. Representerar dess rörelsevektor
	velocity = velocity.move_toward(direction*MAX_SPEED, ACC*delta)
	#velocity = direction * MAX_SPEED
	
	#Inbuyggd rörelsefunktioon: rörelse utförs enligt velocity-vektor och hanterar kollisioner automatiskt
	move_and_slide()

func die() -> void:
	#Funktion som antopas av en enemy då spelaren är tagen
	hide()
	emit_signal("dead")
	
	
	
