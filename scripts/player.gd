extends CharacterBody2D

# criando as variaveis
@export var speed = 100
@export var jump_veocity = -300

@onready var ani_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	var direction = Input.get_axis("left", "right")
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_veocity
	
	if direction > 0:
		ani_sprite.flip_h = false
	elif direction < 0:
		ani_sprite.flip_h = true
		
	if is_on_floor():
		if direction == 0:
			ani_sprite.play("default")
		else:
			ani_sprite.play("run")
	
	else: 
		ani_sprite.play("jump")
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	
	pass
