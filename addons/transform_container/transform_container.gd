@tool
@icon("res://addons/transform_container/transform_container.svg")
class_name TransformContainer
extends Container

## An offset size added to any valid children's size. Can include negative values.
@export
var visual_size := Vector2(0,0) :
	set(value):
		visual_size = value
		queue_sort()

## An offset position added to any valid children's local position. Can include negative values.
@export 
var visual_position : Vector2 :
	set(value):
		visual_position = value
		queue_sort()

## An offset rotation added to any valid children's local rotation. Can include negative values.
@export_range(-360, 360, 0.01, "or_greater", "or_less", "suffix:°") 
var visual_rotation : float = 0.0 :
	set(value):
		visual_rotation = value
		queue_sort()

## A scalar multiplied against any valid children's local scale. Can include negative values.
@export 
var visual_scale := Vector2(1,1) :
	set(value):
		visual_scale = value
		queue_sort()

## A percentage multiplied against any valid children's size and added to their pivot offset. Can include negative values and values farther than 0/1.
@export 
var visual_pivot_offset_perc := Vector2(0,0) :
	set(value):
		visual_pivot_offset_perc = value
		queue_sort()

func _notification(what : int):
	match what: 
		NOTIFICATION_SORT_CHILDREN:
			_sort_children()

func _sort_children():
	# Must re-sort the children
	for c in get_children():
		# Fit to own size
		if c is Control:
			if not c.top_level and c.visible:
				fit_child_in_rect(c, Rect2(Vector2(), size))
				c.position += visual_position
				c.rotation += deg_to_rad(visual_rotation)
				c.size += visual_size
				c.scale *= visual_scale
				c.pivot_offset = c.size * visual_pivot_offset_perc

func _get_minimum_size() -> Vector2:
	var highest_min : Vector2
	for c in get_children():
		if c is Control:
			if not c.top_level and c.visible:
				var c_min_size : Vector2 = c.get_combined_minimum_size()
				highest_min.x = max(highest_min.x, c_min_size.x)
				highest_min.y = max(highest_min.y, c_min_size.y)
	return highest_min
