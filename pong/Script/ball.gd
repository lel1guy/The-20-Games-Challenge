extends CharacterBody2D

var win_size : Vector2 #Defines the win_size variable as a Vector2
const START_SPEED = 500 #The start Speed
@export var speed_multiplier = 1.07 #The rate at the Speed incrises per hit 
var speed : int #Defines the var speed and a interger
var dir : Vector2 #Defines the direction as a Vector2
const MAX_Y_VECTOR : float = 0.6

func _ready():
	win_size = get_viewport_rect().size # Get windows height
	
func new_ball(): #When the ball "Spwans" 
	position.x = win_size.x / 2 # starts always in the midle in x axle
	position.y = win_size.y / 2 #Starts always in the middle of the y axle
	speed = START_SPEED #The spped at which the ball starts
	dir = random_direction() #Goes in a random direction

func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta) #to return a value for the collision
	var collider #The Variable for the collider
	if collision:
		collider = collision.get_collider()#To get the collider value from the collision
		#If the Ball hits the Paddels
		if collider == $"../Player" or collider == $"../Defender":
			speed = speed * speed_multiplier #Incressis the speed by the speed multiplier
			dir = new_direction(collider) #uses the fuction new_direction we made To calculate the angle from which the ball leaves depending where it hits in thje paddle
		#If the ball hits the wall
		else:
			dir = dir.bounce(collision.get_normal()) #Takes care of the "bounce" by using the bounce function which will take the current vector and the collision to get the new direction to move when it bounces
			
		
func random_direction(): # TO pick a random direction to move the ball to start the game
	var new_dir = Vector2()
	new_dir.x =[1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()


func new_direction(collider): #To calculate the angle from which the ball leaves depending where it hits in thje paddle
	var ball_y = position.y #To know the position of the ball in the y axis
	var pad_y = collider.position.y #To know the position of the paddle
	var dist = ball_y - pad_y #To calculate the position bettween the ball and the paddle
	var new_dir := Vector2()
	
	#Flip the horizontal direction
	if dir.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
	
	new_dir.y = (dist / (collider.p_height / 2)) * MAX_Y_VECTOR #We use the distance bettwen the paddles and divde it py half of height of the collider giving us a ratio and then we multiply that ratio witht the MAX_Y_VECTOR
	return new_dir.normalized()
	
	
