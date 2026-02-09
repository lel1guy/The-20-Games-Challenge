extends Control


func _on_player_cpu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn") #Starts the Player vs CPU


func _on_player_player_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/PlayerVsDefender.tscn") #Starts The Player VS Player


func _on_quit_pressed() -> void:
	get_tree().quit()
