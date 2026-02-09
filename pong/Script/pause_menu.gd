extends Control


func _ready() -> void:
	$AnimationPlayer.play("RESET")

func resume(): #a function where the game Resumes
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	
	
func pause(): #A Fucntion where the game pauses
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func esc():
	if Input.is_action_just_pressed("ESC") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("ESC") and get_tree().paused:
		resume()

func _process(delta: float) -> void:
	esc()


func _on_resume_pressed() -> void:
	resume()


func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_quit_menu_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
