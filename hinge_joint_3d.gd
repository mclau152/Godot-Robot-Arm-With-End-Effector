extends HingeJoint3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Enable the motor using the motor flag
	set_flag(FLAG_ENABLE_MOTOR, true)
	# Set initial motor parameters
	set_param(PARAM_MOTOR_TARGET_VELOCITY, 0)  # No initial motion
	set_param(PARAM_MOTOR_MAX_IMPULSE, 10)     # Maximum force the motor can apply

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = 0.0

	# Check for left input and set motor target velocity to -20 deg/s
	if Input.is_action_pressed("ui_left"):
		velocity = deg_to_rad(-100)  # Convert degrees to radians

	# Check for right input and set motor target velocity to +20 deg/s
	if Input.is_action_pressed("ui_right"):
		velocity = deg_to_rad(100)  # Convert degrees to radians

	# If no input is pressed, set velocity to 0
	if Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		velocity = 0

	# Apply the calculated velocity
	set_param(PARAM_MOTOR_TARGET_VELOCITY, velocity)
