extends Node

var bus_index = AudioServer.get_bus_index("Voice")
var spectrum
var magnitude: float

func _ready():
	spectrum = AudioServer.get_bus_effect_instance(bus_index, 0)

func get_magnitude():
	return spectrum.get_magnitude_for_frequency_range(0.0, 20000.0).length() * 10

func _on_timer_timeout():
	if get_magnitude() >= 0.9:
		Events.voice_noise.emit()
