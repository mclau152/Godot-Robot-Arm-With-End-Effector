extends Node3D

@onready var base = $Base
@onready var arm1 = $Base/Arm1
@onready var arm2 = $Base/Arm1/Arm2  # New arm segment
@onready var end_effector = $Base/Arm1/Arm2/Marker3D  # New arm segment

var base_rotation_speed = 1.0  # Radians per second
var arm1_rotation_speed = 1.0  # Radians per second
var arm2_rotation_speed = 1.0  # Radians per second for Arm2

# Input variables
var is_rotating_base = false
var is_rotating_arm1 = false
var is_rotating_arm2 = false  # New variable for Arm2
var base_rotation_direction = 0
var arm1_rotation_direction = 0
var arm2_rotation_direction = 0  # New variable for Arm2

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	handle_input()
	
	# Rotate base
	if is_rotating_base:
		base.rotate_y(base_rotation_direction * base_rotation_speed * delta)
		
	# Rotate arm1
	if is_rotating_arm1:
		arm1.rotate_object_local(Vector3(1, 0, 0), arm1_rotation_direction * arm1_rotation_speed * delta)
		
	# Rotate arm2
	if is_rotating_arm2:
		arm2.rotate_object_local(Vector3(1, 0, 0), arm2_rotation_direction * arm2_rotation_speed * delta)

func handle_input() -> void:
	if Input.is_key_pressed(KEY_SPACE):
		print(end_effector.global_position)
	# Base rotation
	base_rotation_direction = 0
	if Input.is_key_pressed(KEY_A):
		base_rotation_direction = 1
		is_rotating_base = true
	elif Input.is_key_pressed(KEY_D):
		base_rotation_direction = -1
		is_rotating_base = true
	else:
		is_rotating_base = false
	
	# Arm1 rotation
	arm1_rotation_direction = 0
	if Input.is_key_pressed(KEY_W):
		arm1_rotation_direction = 1
		is_rotating_arm1 = true
	elif Input.is_key_pressed(KEY_S):
		arm1_rotation_direction = -1
		is_rotating_arm1 = true
	else:
		is_rotating_arm1 = false
		
	# Arm2 rotation
	arm2_rotation_direction = 0
	if Input.is_key_pressed(KEY_Q):
		arm2_rotation_direction = 1
		is_rotating_arm2 = true
	elif Input.is_key_pressed(KEY_E):
		arm2_rotation_direction = -1
		is_rotating_arm2 = true
	else:
		is_rotating_arm2 = false
