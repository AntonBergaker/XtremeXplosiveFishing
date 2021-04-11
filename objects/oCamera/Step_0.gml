
var newMinX = 50;
var newMaxX = 1600+50;
var newMinY = 50;
var newMaxY = 900+50;

with (oFish) {
	if (phy_speed_x < -5) {
		continue;
	}
	if (inWater == false) {
		newMinX = min(x-50, newMinX);
		newMinY = min(y-50, newMinY);
		newMaxX = max(x+50, newMaxX);
		newMaxY = max(y+50, newMaxY);
	}
}

if (newMinX < minX) {
	newMinX = minX;
}
if (newMinY < minY) {
	newMinY = minY;
}

if (newMaxX > maxX) {
	newMaxX = maxX;
}
if (newMaxY > maxY) {
	newMaxY = maxY;
}

var midX = (newMinX + newMaxX)/2;
var midY = (newMinY + newMaxY)/2;

var newWidth = newMaxX - newMinX;
var newHeight = newMaxY - newMinY;

if (newWidth > newHeight*ratio) {
	newHeight = newWidth/ratio;
} else {
	newWidth = newHeight*ratio;
}

// Scale back down if we went over the sides
var newX0 = midX - newWidth/2;
var newY0 = midY - newHeight/2;
var newX1 = midX + newWidth/2;
var newY1 = midY + newHeight/2;

if (newX0 < minX) {
	newX0 = minX;
}
if (newY0 < minY) {
	newY0 = minY;
}
if (newX1 > maxX) {
	newX1 = maxX;
}
if (newY1 > maxY) {
	newY1 = maxY;
}

if (newX1 - newX0 > (newY1 - newY0)*ratio) {
	newWidth = (newY1 - newY0)*ratio;
	newHeight = (newY1 - newY0);
} else {
	newWidth = (newX1 - newX0);
	newHeight = (newX1 - newX0)/ratio;
}

var resizeStrength = 0.025;

width = lerp(width, newWidth, resizeStrength);
height = lerp(height, newHeight, resizeStrength);
x = lerp(x, (newX0 + newX1)/2, resizeStrength);
y = lerp(y, (newY0 + newY1)/2, resizeStrength);

x0 = x - width /2;
y0 = y - height / 2;
x1 = x + width /2;
y1 = y + height / 2;

shake -= 5/60;
shake *= 0.9;

if (shake < 0) {
	shake = 0;
}

camera_set_view_pos(cam,
	x - width /2 + random_range(-shake, shake),
	y - height/2 + random_range(-shake, shake)
);
camera_set_view_size(cam, width, height);