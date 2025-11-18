extends Level

# Controls the tutorial arrow
func check_arrow_tutorial():
	if $Cats.get_children()[0].get_cat_current_state().name != 'IdleState':
		$Arrow.position = $Step_2.position
	elif $Spots.get_children().reduce(func(total, spot): return total+1 if spot.is_filled else total,0) == 0:
		$Arrow.position = $Step_1.position
	pass
