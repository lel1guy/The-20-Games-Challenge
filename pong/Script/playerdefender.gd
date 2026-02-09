extends CharacterBody2D

var win_height : int # Defines the var win_height (Window Height) as a interger
var p_height : int # Defines the var p_height (Paddle Height) as a interger


func _ready():
	win_height = get_viewport_rect().size.y #To get Window Height
	p_height = $Sprite2D.texture.get_size().y #Gets the Paddle Height from the Sprite2D's Texture


func _process(delta):
	if Input.is_action_pressed("DefenderUp"): #Whyle Up is being presses it moves ussing the paddle_speed var from the parent node "Main" * delta
		position.y -= get_parent().paddle_speed * delta
	elif Input.is_action_pressed("DefenderDown"): #Whyle Down is being presses it moves ussing the paddle_speed var from the parent node "Main" * delta
		position.y += get_parent().paddle_speed * delta
	
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2) #limits the range of movement to not got off the borders by using a clamp 
