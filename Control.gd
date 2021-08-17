extends Control

onready var text = get_parent().get_node("Dialoge").diag1

var dialoge_index = 0
var finished
var active


func _ready():
	load_diag()


func _physics_process(delta):
	if active:

		if Input.is_action_just_pressed("ui_accept"):
			if finished == true:
				load_diag()
			else: 
				$TextBox/Tween.stop_all()
				$TextBox/RichTextLabel.percent_visible = 1
				finished = true
		
		if $Button1.text == "":
			$Button1.visible = false
		else:
			$Button1.visible = true

		if $Button2.text == "":
			$Button2.visible = false
		else:
			$Button2.visible = true
	

func load_diag():
	if dialoge_index < text.size():
		active = true
		finished = false
		
		$TextBox.visible = true
		$TextBox/RichTextLabel.bbcode_text = text[dialoge_index]["Text"]
		$TextBox/NameLabel.text = text[dialoge_index]["Name"]
		$Button1.text = text[dialoge_index]["Choises"][0]
		$Button2.text = text[dialoge_index]["Choises"][1]
		
		$TextBox/RichTextLabel.percent_visible = 0
		$TextBox/Tween.interpolate_property($TextBox/RichTextLabel, 
			"percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$TextBox/Tween.start()
	else:
		$TextBox.visible = false
		finished = true
		active = false
		get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
	dialoge_index += 1 



func _on_Tween_tween_completed(object, key):
	finished = true


func _on_Button1_pressed():
	if $Button1.text == "TO THE LAKE":
		Global.location = "Lake"
		$Button1.text = ""
		$Button2.text = ""
		text = get_parent().get_node("Dialoge").choise1 
		dialoge_index = 0
		load_diag()


func _on_Button2_pressed():
	if $Button2.text == "TO THE PARK":
		Global.location = "Park"
		$Button1.text = ""
		$Button2.text = ""
		text = get_parent().get_node("Dialoge").choise2 
		dialoge_index = 0
		load_diag()
