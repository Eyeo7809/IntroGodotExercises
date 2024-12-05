extends Node2D

var score = 0
@export var txtScore : Label
@export var player : Node2D
@export var spawner : Node2D

@export var highscoreUI : Control
# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("res://saveData/highScore.txt", FileAccess.WRITE)
	var baseScores = [0]
	file.store_var(baseScores)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _add_score():
	score += 1
	txtScore.text = str(score)
	
func game_over():
	
	#this is lazy..
	if(player != null):
		player.queue_free()
		spawner.queue_free()
	
	#Project Start
	var file = FileAccess.open("res://saveData/highScore.txt", FileAccess.READ_WRITE)
	
	var highScores = file.get_var()
	
	for savedScore in highScores:
		if score > savedScore:
			highscoreUI.visible = true
			
	

	


func _on_btn_enter_name_pressed() -> void:
	pass # Replace with function body.
