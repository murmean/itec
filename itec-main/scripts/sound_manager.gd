extends Node

@onready var money_collected_1 = $money_collected_1
@onready var keycard_collected_1 = $keycard_collected_1
@onready var screwdriver_collected_1 = $screwdriver_collected_1

@onready var shop_purchase_1 = $shop_purchase_1
@onready var locker_enter_1 = $locker_enter_1
@onready var locker_exit_1 = $locker_exit_1

@onready var music_calm_1 = $music_calm_1
@onready var music_ambient_1 = $music_ambient_1
@onready var music_ambient_1_anim = $music_ambient_1/music_ambient_1_anim
@onready var music_imminent_1 = $music_imminent_1
@onready var music_imminent_1_anim = $music_imminent_1/music_imminent_1_anim
@onready var music_chase_1 = $music_chase_1

func _ready():
	Events.money_collected.connect(_money_collected)
	Events.keycard_collected.connect(_keycard_collected)
	Events.screwdriver_collected.connect(_screwdriver_collected)
	
	Events.shop_purchase.connect(_shop_purchase)
	Events.locker_enter.connect(_locker_enter)
	Events.locker_exit.connect(_locker_exit)
	
	Events.music_enable_ambient.connect(music_enable_ambient)
	Events.music_disable_ambient.connect(music_disable_ambient)
	Events.music_enable_imminent.connect(music_enable_imminent)
	Events.music_disable_imminent.connect(music_disable_imminent)
	Events.music_enable_chase.connect(music_enable_chase)
	Events.music_disable_chase.connect(music_disable_chase)
	
	Events.voice_noise.connect(voice_noise)

func _money_collected():
	money_collected_1.play()

func _keycard_collected():
	keycard_collected_1.play()

func _screwdriver_collected():
	screwdriver_collected_1.play()

func _shop_purchase():
	shop_purchase_1.play()

func _locker_enter():
	locker_enter_1.play()
	var bus_index = AudioServer.get_bus_index("Music")
	AudioServer.get_bus_effect(bus_index, 2).set_cutoff(2000.0)
	AudioServer.get_bus_effect(bus_index, 3).set_pan_pullout(0.0)
	bus_index = AudioServer.get_bus_index("CreativeFX")
	AudioServer.get_bus_effect(bus_index, 0).set_cutoff(2000.0)
	AudioServer.get_bus_effect(bus_index, 1).set_pan_pullout(0.0)

func _locker_exit():
	locker_exit_1.play()
	var bus_index = AudioServer.get_bus_index("Music")
	AudioServer.get_bus_effect(bus_index, 2).set_cutoff(20000.0)
	AudioServer.get_bus_effect(bus_index, 3).set_pan_pullout(1.0)
	bus_index = AudioServer.get_bus_index("CreativeFX")
	AudioServer.get_bus_effect(bus_index, 0).set_cutoff(20000.0)
	AudioServer.get_bus_effect(bus_index, 1).set_pan_pullout(1.0)

func music_enable_ambient():
	music_ambient_1.volume_db = -80
	music_ambient_1.play()
	music_ambient_1_anim.play("music_fade_in")

func music_disable_ambient():
	music_ambient_1_anim.play("music_fade_out")

func music_enable_imminent():
	music_imminent_1.volume_db = -80
	music_imminent_1.play()
	music_imminent_1_anim.play("music_fade_in")

func music_disable_imminent():
	music_imminent_1_anim.play("music_fade_out")

func music_enable_chase():
	music_calm_1.stop()
	music_ambient_1.stop()
	music_imminent_1.stop()
	
	music_chase_1.volume_db = 0
	music_chase_1.play()

func music_disable_chase():
	music_chase_1.stop()
	music_calm_1.play()

func voice_noise():
	screwdriver_collected_1.play()
