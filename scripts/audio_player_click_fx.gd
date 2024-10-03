extends AudioStreamPlayer2D

const click_sound = preload("res://assets/fx/342200__christopherderp__videogame-menu-button-click.wav")

func _play(effect: AudioStream, volume: float = 0.0):
	stream = effect
	volume_db = volume
	play()

func play_effect():
	_play(click_sound)
