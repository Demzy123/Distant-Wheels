extends CanvasLayer

@export var arena_time_manager: Node
@onready var label = %Label


func _process(delta):
	if arena_time_manager == null: return
	var time_elapsed = arena_time_manager.get_time_elapsed()
	label.text = format_timer(time_elapsed)
	
func format_timer (seconds: float):
	var minutes = floor(seconds/60)
	var hours = floor(minutes/60)
	var remaining_seconds = seconds - (minutes * 60)
	var remaining_minutes = minutes - (hours * 60)
	if minutes == 0: return "%01d"  % floor(remaining_seconds)
	if hours == 0: return "%02d" % floor(remaining_minutes) + ":" + "%02d"  % floor(remaining_seconds)
	return "%02d" % floor(hours) + ":" + "%02d" % floor(remaining_minutes) + ":" + "%02d"  % floor(remaining_seconds)
	
