extends Node

signal prepared_cat_changed

var menu_scene: PackedScene = preload("res://scenes/main_menu.tscn")
var prepared_cat: Node2D = null

var ui_main_color: Color = Color('e3b76f')
var ui_secondary_color: Color = Color('80a9ab')
var ui_back_color: Color = Color('463610')

func change_prepared_cat(cat: Node2D):
	prepared_cat = cat
	prepared_cat_changed.emit()
