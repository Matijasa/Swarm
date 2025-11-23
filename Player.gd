class_name PlayerEntity
extends CharacterBody2D

# Components
var input_component = PlayerInputComponent.new()
var weapon_component = WeaponComponent.new()

func _ready():
	# Load the bullet blueprint into the component
	weapon_component.bullet_scene = load("res://Entities/Projectiles/Bullet.tscn")
