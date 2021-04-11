
var fishCount = instance_number(oFish);

repeat (10 - fishCount) {
	var xx = random_range(-300, -100);
	var yy = random_range(global.waterY+100, 900);
	
	var fish = instance_create_layer(xx, yy, "InWater", oFish);
	fish.image_alpha = 0;
}