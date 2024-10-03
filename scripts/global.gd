extends Node

signal prepared_cat_changed

var menu_scene: PackedScene = preload("res://scenes/main_menu.tscn")
var prepared_cat: Node2D = null

func change_prepared_cat(cat: Node2D):
	prepared_cat = cat
	prepared_cat_changed.emit()
