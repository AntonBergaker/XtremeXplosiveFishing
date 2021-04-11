
draw_self();

if (isFishing) {
	exit;
}

var dir = armDir+125+180;
var index = 0;

if (flipArmTimer > 0) {
	dir += 180;
	index = 1;
}

draw_sprite_ext(sPlayerArm, index, x, y, 1, 1, dir, c_white, 1);

if (outOfMoney) {
	draw_set_font(fComic);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_outline(x-500, y-100, "Out of money.\nHold space to use last ditch effort.", c_white, 1);
}

if (charge > 0) {
	var total = 205-4-4;
	var chargeY = total*charge;
	
	draw_sprite_part(sChargeBar, 1, 0, total - chargeY, 29, chargeY+4, x-100, y-150 + total - chargeY + 4);
	draw_sprite(sChargeBar, 0, x-100, y-150);
}