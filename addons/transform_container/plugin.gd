@tool
extends EditorPlugin

const node := preload("res://addons/transform_container/transform_container.gd")
const icon := preload("res://addons/transform_container/transform_container.svg")


func _enter_tree() -> void:
	add_custom_type("TransformContainer", "Container", node, icon)


func _exit_tree() -> void:
	remove_custom_type("TransformContainer")
