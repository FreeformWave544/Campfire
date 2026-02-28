extends StaticBody2D

@export var displayName := "NPC"
@export var dialogue: Array[String] = []
@export_enum("None", "Firewall", "Alfie") var triggerEvent = "None"
