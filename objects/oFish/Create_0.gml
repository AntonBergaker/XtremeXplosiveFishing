image_xscale = random_range(0.8, 1);
image_yscale = image_xscale;

image_index = irandom(2);
image_speed = 0;

inWater = true;
timer = random(pi*2);
affectedByExplosionTimer = 0;
givePointTimer = 0;
inWaterLayer = layer_get_id("InWater");
outsideWaterLayer = layer_get_id("Instances");

targetX = x; ///@is {number}
targetY = y; ///@is {number}
waitingTimer = random_range(0, 150);
flippedFish = choose(-1, 1);

function begin_decay() {
	if (givePointTimer <= 0) {
		givePointTimer = 1;
		oControl.money += 100;
		var aud = audio_play_sound(sndDing, 0, false);
		audio_sound_pitch(aud, random_range(0.9, 1.1));
	}
}
