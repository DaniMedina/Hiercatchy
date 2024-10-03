extends Level

func check_arrow_tutorial():
	if Global.prepared_cat != null:
		$Arrow.position = $Step_2.position
	elif filled_spots == 0:
		$Arrow.position = $Step_1.position
	pass
