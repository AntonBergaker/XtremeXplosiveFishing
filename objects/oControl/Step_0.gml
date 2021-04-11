
if (keyboard_check_pressed(ord("R"))) {
	game_restart();
}

canAffordRod = money >= 2000;

if (canAffordRod && hasRod == false && keyboard_check_pressed(vk_space)) {
	hasRod = true;
	money -= 2000;
}

displayMoney = lerp(displayMoney, money, 0.1);
displayMoney = value_shift(displayMoney, money, 0.5);