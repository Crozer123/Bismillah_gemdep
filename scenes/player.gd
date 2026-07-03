extends CharacterBody2D
@export var speed: float = 200.0

func _physics_process(_delta: float) -> void:
	handle_movement()

func handle_movement() -> void:
	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")
	var direction := Vector2(direction_x, direction_y)
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
