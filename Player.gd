class_name PlayerEntity # Optional, helps finding it later
extends CharacterBody2D

# The Player HAS A component.
# We create a new instance of the data container here.
var input_component: PlayerInputComponent = PlayerInputComponent.new()
