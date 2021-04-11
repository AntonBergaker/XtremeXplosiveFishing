
draw_set_font(fComic);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(10, 10, string(round(displayMoney)) + "€");

if (oPlayer.dead) {
	draw_text(10, 40, string("You tried. Press R to play again."));
} else if (canAffordRod) {
	draw_text(10, 40, string("Press Space to buy Fishing Rod"));
} else if (hasRod) {
	draw_text(10, 40, string("Much more economic. Press R to play again."));
} else {
	draw_text_transformed(10, 40, string("You need 2000€ to buy a Fishing Rod"), 0.8, 0.8, 0);
}