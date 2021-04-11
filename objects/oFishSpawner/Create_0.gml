
repeat(10) {
	var pos = get_random_water_position();
	instance_create_layer(pos[0], pos[1], "InWater", oFish);
	
}
