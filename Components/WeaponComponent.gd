class_name WeaponComponent
extends Resource

# Data: What do we shoot?
@export var bullet_scene: PackedScene 
@export var fire_rate: float = 0.1
@export var damage: float = 10.0

# Data: Dynamic State
var cooldown_timer: float = 0.0
