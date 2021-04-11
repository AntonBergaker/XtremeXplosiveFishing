image_xscale = random_range(1.4, 1.6) * choose(-1, 1);
image_yscale = image_xscale * choose(-1, 1);
image_angle = random(360);


with (oFish) {
	var diffX = x - other.x;
	var diffY = y - other.y;
	var magnitude = point_distance(0, 0, diffX, diffY);
	var strength = clamp(500 - magnitude, 0, 500)/50;
	if (strength > 0) {
		physics_apply_impulse(phy_position_x+random(1), phy_position_y+random(1), strength * diffX/magnitude, strength * diffY/magnitude);
		affectedByExplosionTimer = 5;
	}
}

var aud = audio_play_sound(sndBoom, 0, false);
audio_sound_pitch(aud, random_range(0.9, 1.1));