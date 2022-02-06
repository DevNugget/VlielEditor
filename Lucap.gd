extends Control

var cursorimage = load("res://Cursor (1) (1).png")
var ren = null

func _ready() -> void:
	Global.text_edit_node = $TextEdit
	#Input.set_custom_mouse_cursor(cursorimage)
	#Input.set_custom_mouse_cursor(cursorimage, Input.CURSOR_IBEAM)

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("Control"):
		if Input.is_action_just_pressed("Q"):
			if $Menu.visible == true:
				$Menu.visible = false
			else:
				$Menu.visible = true
	if event is InputEventKey and event.pressed:
		$Keylog.bbcode_text = "KEY: " + str(OS.get_scancode_string(event.scancode))
	if Input.is_action_just_pressed("SaveText"):
		var file = File.new()
		file.open(ren, 2)
		file.store_string($TextEdit.text)
		file.close()
	
	if Input.is_action_just_pressed("OpenFile"):
		$OpenDialog.popup()

func _on_Save_pressed() -> void:
	if ren != null:
		var file = File.new()
		file.open(ren, 2)
		file.store_string($TextEdit.text)
		file.close()


func _on_Open_pressed() -> void:
	$OpenDialog.popup()


func _on_OpenDialog_file_selected(path: String) -> void:
	var file = File.new()
	file.open(path, 1)
	ren = path
	$TextEdit.text = file.get_as_text()
	file.close()


func _on_SaveDialog_file_selected(path: String) -> void:
	var file = File.new()
	file.open(path, 2)
	file.store_string($TextEdit.text)
	file.close()

func _physics_process(delta: float) -> void:
	var time_dict = OS.get_time()
	var hour = time_dict.hour
	var minute = time_dict.minute
	
	$Time.bbcode_text = "SYS TIME: " + str(hour) + ":" + str(minute)
	
	var col = $TextEdit.cursor_get_column()
	var row = $TextEdit.cursor_get_line()
	
	$Col.bbcode_text = "COL: " + str(col) + " ROW: " + str(row)

	if Input.is_action_just_pressed("fontscaleup"):
		$TextEdit.get_font('font').size += 1
		#$TextEdit.add_font_override("string_name", font)
	if Input.is_action_just_pressed("fontscaledown"):
		$TextEdit.get_font('font').size -= 1







