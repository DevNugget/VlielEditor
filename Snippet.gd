extends ColorRect


export (String, MULTILINE) var text = ""
export (String, MULTILINE) var ins_text = ""
export var min_height = 50
export var call_back = 0
export var lineadd = 0
var caretpos
var caretrow

func _ready() -> void:
	$RichTextLabel.bbcode_text = text
	rect_min_size.y = min_height

func _physics_process(delta: float) -> void:
	caretpos = Global.text_edit_node.cursor_get_column()
	caretrow = Global.text_edit_node.cursor_get_line()
	

func _on_Button_pressed() -> void:
	Global.text_edit_node.grab_focus()
	Global.text_edit_node.insert_text_at_cursor(ins_text)
	Global.text_edit_node.cursor_set_column(caretpos + call_back)
	Global.text_edit_node.cursor_set_line(caretrow)
	Global.text_edit_node.cursor_set_line(Global.text_edit_node.cursor_get_line() + lineadd)
