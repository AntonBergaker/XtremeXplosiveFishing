fuseTime -= 1/60;
if (fuseTime < 0) {
	instance_create_layer(x, y, "Instances", oExplosion);
	
	var dist = point_distance(x, y, oPlayer.x, oPlayer.y);
	var shake = clamp(15 - dist/500, 1, 10);
	if (inWater) {
		shake *= 0.75;
	}
	oCamera.shake += shake;
	
	instance_destroy();
	exit;
}

if (inWater == false) {
	if (y > global.waterY) {
		inWater = true;
		phy_speed_y*=0.75;
		image_blend = c_aqua;
	}
}

if (inWater) {
	physics_apply_force(phy_position_x, phy_position_y, 0, phy_mass * global.gravity/2);
} else {
	physics_apply_force(phy_position_x, phy_position_y, 0, phy_mass * global.gravity);
}