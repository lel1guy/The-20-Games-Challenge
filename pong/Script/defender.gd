extends CharacterBody2D

var ball_pos : Vector2 #Defines the ball position variable, ball_pos, as a Vector2 
var dist : int #defines the distance varibale, dist, as a interger
var move_by : int #I think we can guess this by now
var win_height : int
var p_height : int

func _ready() -> void:
	win_height = get_viewport_rect().size.y #To get Window Height
	p_height = $Sprite2D.texture.get_size().y #Gets the Paddle Height from the Sprite2D's Texture

func _process(delta):
	ball_pos = $"../Ball".position #To get the Ball Position
	dist = position.y - ball_pos.y # to calculate the distance bettwen the Defender and the ball in y axis
	
	if abs(dist) > get_parent().paddle_speed * delta: #To see if the absule of the distance is greater then the Paddle Speed variable from main * delta
		move_by = get_parent().paddle_speed * delta *(dist / abs(dist)) #to make the paddle move, we use (dist / abs(dist)) to know if it goes up or down since using abs(dist) always gives a possitve value.
	else: #If it aint greater
		move_by = dist 
	
	
	
	position.y -= move_by 
	
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2) #limits the range of movement to not got off the borders by using a clamp 
	
	
