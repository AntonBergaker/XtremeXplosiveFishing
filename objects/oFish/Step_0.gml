inWater = y > global.waterY;
if (x > 1400) {
	inWater = false;
}
layer = inWater ? inWaterLayer : outsideWaterLayer;
image_alpha += 0.1;

if (givePointTimer > 0) {
	givePointTimer++;
	image_alpha = 1 - givePointTimer/60;
	
	if (givePointTimer > 60) {
		instance_destroy();
		exit;
	}
} else {
	if (y > 600 && inWater == false) {
		begin_decay();
	}
}

if (inWater) {
	waitingTimer--;
	if (waitingTimer <= 0) {
		var pos = get_random_water_position();
		targetX = pos[0];
		targetY = pos[1];
		var dir = point_direction(x, y, targetX, targetY);
		physics_apply_impulse(phy_position_x, phy_position_y, lengthdir_x(2, dir), lengthdir_y(2, dir));
		waitingTimer = random_range(150, 200);
		
		flippedFish = targetX < x ? -1 : 1;
	}
	
	if (affectedByExplosionTimer < 0) {
		phy_rotation = angle_lerp(phy_rotation, 0, 0.1);
	}
	
	if (point_distance(x, y, targetX, targetY) > 100) {
		var dir = point_direction(x, y, targetX, targetY);
		physics_apply_force(phy_position_x, phy_position_y, lengthdir_x(0.5, dir), lengthdir_y(0.5, dir));
	}
}

affectedByExplosionTimer--;
timer += 1 / 60;

if (inWater == false) {
	physics_apply_force(phy_position_x, phy_position_y, 0, phy_mass * global.gravity*1.5);
	if (y < -700) {
		physics_apply_force(phy_position_x, phy_position_y, 0, phy_mass * global.gravity*1.5);	
	}
} else {
	if (y < global.waterY+100) {
		physics_apply_force(phy_position_x, phy_position_y, 0, phy_mass * global.gravity * 0.25);
	}
	
	physics_apply_force(phy_position_x, phy_position_y, 0, sin(timer*3)/10);
	
	if (affectedByExplosionTimer < 0) {
		phy_speed_x *= 0.9;
		phy_speed_y *= 0.9;
	}
}

if (x < -500) {
	instance_destroy();
}

image_xscale = flippedFish;
