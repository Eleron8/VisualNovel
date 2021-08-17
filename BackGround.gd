extends Node2D

var location


func _ready():
	pass



func _process(delta):
	if Global.location == "City":
		$Sprite.texture = load("res://Art/Background/StreetCity.jpg")
		$Sprite.scale.x = 960/$Sprite.texture.get_size().x
		$Sprite.scale.y = 490/$Sprite.texture.get_size().y
	
	if Global.location == "Park":
		$Sprite.texture = load("res://Art/Background/ChurchCity.jpg")
		$Sprite.scale.x = 960/$Sprite.texture.get_size().x
		$Sprite.scale.y = 490/$Sprite.texture.get_size().y

	if Global.location == "Lake":
		$Sprite.texture = load("res://Art/Background/LakeCity.png")
		$Sprite.scale.x = 960/$Sprite.texture.get_size().x
		$Sprite.scale.y = 490/$Sprite.texture.get_size().y
