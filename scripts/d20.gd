extends Control

@onready var dice_menu = $DiceMenu
@onready var total_score = $TotalScore
@onready var dice_face = $DiceFace
@onready var dice_pics = {
1: load("res://assets/art/dieWhite_border1.png"),
2: load("res://assets/art/dieWhite_border2.png"),
3: load("res://assets/art/dieWhite_border3.png"),
4: load("res://assets/art/dieWhite_border4.png"),
5: load("res://assets/art/dieWhite_border5.png"),
6: load("res://assets/art/tayne Small.png"),
}

var names = {
	1: "Tayne",
	2: "Taynee",
	3: "Tayn",
	4: "Taina",
	5: "Taynia",
	6: "Taynna",
	7: "Tayneia",
	8: "Taynè",
	9: "Tayne",
	10: "Tay",
	11: "Taytay",
	12: "Taya",
	13: "Ty",
	14: "Neen",
	15: "Taynie",
	16: "Mary Tayne",
	17: "Anne Tayne",
	18: "Rose Tayne",
	19: "Tayne Marie",
	20: "Tayne Alexandra",
	21: "Elizabeth Tayne",
	22: "Tayne James",
	23: "Tayne Blake",
	24: "Tayne the Bold",
	25: "Tayne the Brave",
	26: "Tayne the Kind",
	27: "Tayne the Adventurous",
	28: "Tayne of the Stars",
	29: "Tayne of the Whispering Pines",
	30: "Taina", 
	31: "Taine",
	32: "Tânia",
	33: "Taynester",
	34: "Taynelight",
	35: "Taynedream",
	36: "Evertayne",
	37: "Tayneson",
	38: "Tayne-tastic",
	39: "Enter-Tayne-ment",
	40: "Can't Tayne You Away",
}


var n := 0


func _ready() -> void:
	var popup = dice_menu.get_popup()
	
	popup.id_pressed.connect(dice_select)

func dice_select(id):
	print(id)
	match(id):
		0:
			print("d20")


func roll():
	n = randi_range(1, 6)

func check():
	if n == 6:
		dice_face.position =  Vector2(648, 278)
		total_score.text = "you rolled a " + str(n) + ", " + names[randi_range(1, 40)]
		print("Nice! you rolled a ", str(n))
		dice_face.texture = dice_pics[n]
	elif n == 1:
		dice_face.position =  Vector2(648, 192)
		total_score.text = "Oh no! You rolled a " + str(n)
		print("Oh no! You rolled a ", str(n))
		dice_face.texture = dice_pics[n]
	else:
		dice_face.position =  Vector2(648, 192)
		total_score.text = "You rolled " + str(n)
		print("you rolled ", str(n))
		dice_face.texture = dice_pics[n]

func d6():
	#while n != 20:
	roll()
	check()
	n = 0

func _on_roll_button_pressed() -> void:
	d6()
