extends Sprite2D

var score = [0, 0] # Defines the score varieable as an arrey being the 1st value the player and the 2nd the defender [(Player : 0, Defender : 1) arreys in code start in 0]
@export var paddle_speed = 500 #Paddle Movement Speed -  @Export Lets edit the speed in the editor insetead of the code


func _on_ball_timer_timeout() -> void:
	$Ball.new_ball() #call the Function new_ball from the Ball Scene/Node's code


func _on_goal_left_body_entered(body: Node2D) -> void: #When the a ball enters the GoalLeft
	score [1] += 1 #It increses the Defender Score
	$Hud/CPUScore.text = str(score[1]) #Uptades the defender score in the HUD
	$BallTimer.start() #Restarts the BallTimer


func _on_goal_right_body_entered(body: Node2D) -> void: # When the ball enters the GoalRight
	score [0] += 1 #It increses the Player Score
	$Hud/PlayerScore.text = str(score[0]) #Updates the Player score in the HUD
	$BallTimer.start() #Restarts the BallTimer
