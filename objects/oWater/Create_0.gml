
width = 30;
height = 10;
alpha = 1;

timer = random(64);

waterTiles = ds_grid_create(width, height); ///@is {ds_grid<int>}

for (var xx=0;xx<width;xx++) {
	for (var yy=0;yy<height;yy++) {
		waterTiles[# xx, yy] = irandom(sprite_get_number(sWater)-1);
	}
}