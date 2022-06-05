extends Node2D

var directory = Directory.new()
var random_generator = RandomNumberGenerator.new()
var pic = 9
const minq = 0
const maxq = 8
var bg = false
var file2Check = File.new()
var i_name = ""
var i_ver = ""
var output = []
var com = false
var key = []
var des = ""
var save = Save.edit_data("save",".bea")
var filechecker = File.new()

func _ready():
	if filechecker.file_exists("user://save.bea"):
		$productkey/key.text = save.key
	else:
		var data = {"key" : ""}
		Save.save_data(data,"save",".bea")
	$bgt.start()
	random_generator.randomize()
	pic = random_generator.randi_range(minq,maxq)
	if pic == 0:
		$bg.texture = load("res://ui/bg.jpg")
	if pic == 1:
		$bg.texture = load("res://ui/bg1.jpg")
	if pic == 2:
		$bg.texture = load("res://ui/bg2.jpg")
	if pic == 3:
		$bg.texture = load("res://ui/bg3.jpg")
	if pic == 4:
		$bg.texture = load("res://ui/bg4.jpg")
	if pic == 5:
		$bg.texture = load("res://ui/bg5.jpg")
	if pic == 6:
		$bg.texture = load("res://ui/bg6.jpg")
	if pic == 7:
		$bg.texture = load("res://ui/bg7.jpg")
	if pic == 8:
		$bg.texture = load("res://ui/bg8.jpg")
		

func _physics_process(delta):

	
	
	$console/ScrollContainer/Container/text.text = str(output)
	
	if pic == 0:
		$bg.texture = load("res://ui/bg.jpg")
	if pic == 1:
		$bg.texture = load("res://ui/bg1.jpg")
	if pic == 2:
		$bg.texture = load("res://ui/bg2.jpg")
	if pic == 3:
		$bg.texture = load("res://ui/bg3.jpg")
	if pic == 4:
		$bg.texture = load("res://ui/bg4.jpg")
	if pic == 5:
		$bg.texture = load("res://ui/bg5.jpg")
	if pic == 6:
		$bg.texture = load("res://ui/bg6.jpg")
	if pic == 7:
		$bg.texture = load("res://ui/bg7.jpg")
	if pic == 8:
		$bg.texture = load("res://ui/bg8.jpg")

func _on_bgt_timeout():
	bg = false
	$AnimationPlayer.play("fade")


func _on_AnimationPlayer_animation_finished(anim_name):
	if bg == false:
		bgr()
		$AnimationPlayer.play("unfade")
		bg = true
	if bg == true:
		$bgt.start()

func bgr():
	random_generator.randomize()
	pic = random_generator.randi_range(minq,maxq)


func _on_add_pressed():
	if file2Check.file_exists("res://files.bea"):
		ProjectSettings.load_resource_pack("res://files.pck")
		if file2Check.file_exists("res://files.pck"):
			$name.set_script(load("res://file.gd"))
			i_name = $name.gname
			key = $name.keys
			$game/gname.text = $name.gname
			$game.texture = load("res://" + $name.iname + "/gicon.png")
			print(i_name)
			$productkey.visible = true
		else:
			$error.visible = true
			$error/content.text = "files.Pck Cant Find :("
	else:
		$error.visible = true
		$error/content.text = "files.bea Cant Find :("


func _on_FileDialog_dir_selected(dir):
	des = dir
	$wait.visible = true
	dir = dir
	com = true
	$add2.visible = true
	$add.visible = false
	$FileDialog.visible = false
	$delay.start()


func _on_add2_pressed():
	$console.visible = true




func _on_go_pressed():
	var keys = key.find($productkey/key.text)
	if keys == -1:
		$productkey/err.visible = true
	else:
		save.key = $productkey/key.text
		Save.save_data(save,"save",".bea")
		$productkey.visible = false
		$FileDialog.visible = true


func _on_hide_timeout():
	$productkey/hide.start()
	$productkey/err.visible = false


func _on_delay_timeout():
	$console.visible = true
	OS.execute("component/UnRAR.exe", ["x","-pkingbunner123","files.bea ", des], true, output)



func _on_web_pressed():
	OS.shell_open("www.beatrix-games.ga/html/keyg")


func _on_dx_pressed():
	if file2Check.file_exists("dxwebsetup.exe"):
		OS.execute("dxwebsetup.exe", [""], false, output)
	else:
		$error.visible = true
		$error/content.text = "component/dxwebsetup.exe Cant Find :("

func _on_add3_pressed():
	$compo.visible = true
