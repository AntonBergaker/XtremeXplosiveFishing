
flipArmTimer-=1/60;
var targetArmDir = point_direction(x, y, mouse_x, mouse_y);

isFishing = oControl.hasRod;
outOfMoney = oControl.money < 100;

if (dead) {
	exit;
}
if (isFishing) {
	sprite_index = sFisherDylan;
	exit;
}
var chargeCheckKey = outOfMoney ? keyboard_check(vk_space) : mouse_check_button(mb_left);

if (chargeCheckKey) {
	charge += 1/60;
	if (charge > 1) {
		charge = 1;
	}
}
else {
	if (charge > 0) {
		flipArmTimer = 0.1;
		var inst = instance_create_layer(x+lengthdir_x(50, armDir), y+lengthdir_y(50, armDir), "Instances", oDynamite);
		var strength = charge*0.5;
		with (inst) {
			physics_apply_impulse(phy_position_x, phy_position_y, lengthdir_x(strength, other.armDir), lengthdir_y(strength, other.armDir));
		}
		charge = 0;
		if (outOfMoney) {
			inst.sprite_index = sprite_index;
			dead = true;
			visible = false;
		} else {
			oControl.money-= 100;
		}
	}
}


armDir = angle_lerp(armDir, targetArmDir, 5);