extends AudioStreamPlayer2D

const meows: Array[AudioStreamWAV] = [preload("res://assets/fx/262312__steffcaffrey__cat-meow1.wav"),preload("res://assets/fx/262313__steffcaffrey__cat-meow2.wav"),preload("res://assets/fx/262314__steffcaffrey__cat-meow3.wav"),preload("res://assets/fx/479271__steffcaffrey__new-cat-meow-2.wav"),preload("res://assets/fx/262309__steffcaffrey__cat-purrtwit4.wav")]

func _play_fx(effect: AudioStream, volume: float = 0.0):
	if stream == effect:
		play_random_fx()
		return
		
	stream = effect
	volume_db = volume
	play()

func play_random_fx():
	var effect = meows[randi_range(0,meows.size()-1)]
	_play_fx(effect)
