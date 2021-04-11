
for (var xx=0;xx<width;xx++) {
	var start = x + timer mod 64;
	var index = safe_mod(width + xx - (timer div 64), width);
	draw_sprite_ext(sWave, 0, start + xx*64, y + 0*64 + 64 + sin(xx*1 + timer/2), 1, 1, 0, c_white, alpha);
}

for (var xx=0;xx<width;xx++) {
	for (var yy=1;yy<height;yy++) {
		var start = x + timer mod 64;
		var index = safe_mod(width + xx - (timer div 64), width);
		draw_sprite_ext(sWater, waterTiles[# index, yy], start + xx*64, y + yy*64 + 64 + sin(xx*1 + timer/2), 1, 1, 0, c_white, alpha);
	}
}