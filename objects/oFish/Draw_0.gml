draw_self();

var frameIndex = -1;

if (x > oCamera.x1 + 100) {
	frameIndex += 1;
}
if (y < oCamera.y0 - 100) {
	frameIndex += 2;
}
if (frameIndex >= 0) {
	var xx = clamp(x, -10000, oCamera.x1 - 140);
	var yy = clamp(y, oCamera.y0 + 140, 10000);
	draw_sprite( sFishFrame, frameIndex, xx, yy );
	draw_sprite_ext(sprite_index, image_index, xx, yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}