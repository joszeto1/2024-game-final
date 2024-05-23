extends CharacterBody2D

signal enough_flakes
signal health_depleted

var health = 100.0
var score_count = 0
var speed = 600

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right",
	"move_up","move_down")
	velocity = direction * speed
	move_and_slide()
	
	if velocity.length() > 0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
		
	const DAMAGE_RATE = 10.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
	
func set_score(new_score):
	score_count = new_score
	get_node("UI/ScoreLabel").text = "x" + str(score_count)
	
	if score_count == 15:
		speed = 1000
		
	if score_count == 20:
		enough_flakes.emit()
	

func _on_area_2d_area_entered(area):
	set_score(score_count + 1)
