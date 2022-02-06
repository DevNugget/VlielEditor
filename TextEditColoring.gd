extends TextEdit


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var keywords = [
		"push",
		"obj",
		"end",
		"proc",
		"def",
		"args",
		"in",
		"endproc",
		"if",
		"then",
		"endif",
		"for",
		"during",
		"endloop",
		"do",
		"stat",
		"callproc",
		"file",
		"readfile",
		"use",
		"writefile",
		"write",
		"read",
		"op",
		"int",
		"str",
		"float",
		"string",
		"bool",
		"list",
		"pull",
		"+",
		"-",
		"const",
		"$",
		"rep",
		"alias",
		"hop",
		"throw",
		"per",
		"ref", 
		"array"
	]
	
	for keyword in keywords:
		add_keyword_color(keyword, Color(1, 0.866667, 0.2))
	
	add_color_region('"', '"', Color(0.45098, 0.788235, 0.211765))
	add_keyword_color("com", Color(0.45098, 0.788235, 0.211765))
