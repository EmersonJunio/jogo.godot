extends CharacterBody2D

@onready var pause_menu = $"../Pause_Menu"

const SPEED = 250.0 #variavel da velocidade atribui 300.0
const JUMP_VELOCITY = -350.0 #variavel do pulo atribui -400.0
var isjumping = false #variavel pra confirma se esta pulando ou não
# adiciona valor ja definido a variavel gravidade
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var jumpmade = 0
var is_takingdamage = false
var is_portal = false

var vida = 3

signal dead

func _physics_process(delta):
	# adiciona gravidade
	if not is_on_floor() :
		velocity.y += gravity * delta
		
	# se o personagem tiver no chão e aperta o botão de pulo, o personagem ira sair do chão 
	if Input.is_action_just_pressed("ui_accept") and !is_takingdamage and (is_on_floor() || jumpmade < 2 ):
		velocity.y = JUMP_VELOCITY
		jumpmade += 1
		isjumping=true
	elif is_on_floor():
		jumpmade = 0  
		isjumping=false
	# se voce aperta um botão o personagem ira para direito ou para equerda

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction !=0 and !is_takingdamage:
		velocity.x = direction * SPEED	#	
		$AnimatedSprite2D.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#errado porém pode usar para "area dash"
	#if is_takingdamage:
	#	if direction < 0:
	#		velocity.x = -1000
	#	elif direction >0: 
	#		velocity.x = 1000
	if is_takingdamage:
		if direction < 0:
			velocity.x = 400
		elif direction >0: 
			velocity.x = -400
			
	move_and_slide()
	
	#animação pulo
	if !is_takingdamage:
		if is_on_floor():
			if isjumping:
				$AnimatedSprite2D.play("jump")
				
			elif direction !=0:
				$AnimatedSprite2D.play("run")
			elif direction ==0:
				$AnimatedSprite2D.play("idle")
		else:
			if velocity.y < 0:
				$AnimatedSprite2D.play("jump")
			else:
				$AnimatedSprite2D.play("fall")
			
			
func _LevouDano(dano):
	
	is_takingdamage = true
	print(velocity.x)
	print("Sim, levou dano;-;")	
	$AnimatedSprite2D.play("hit")
	await $AnimatedSprite2D.animation_finished
	is_takingdamage = false
	
	vida -=dano
 
	if vida <= 0:
		_Morte()
		
func _Morte():
	emit_signal("dead")
	
	



