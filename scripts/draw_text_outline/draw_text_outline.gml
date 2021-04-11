///@param x
///@param y
///@param text
///@param color
///@param alpha

function draw_text_outline(_x, _y, _text, _color, _alpha) {
	draw_set_color(c_black);
	draw_text_color(_x -1, _y -1, _text, c_black, c_black, c_black, c_black, _alpha*_alpha);
	draw_text_color(_x -1, _y +1, _text, c_black, c_black, c_black, c_black, _alpha*_alpha);
	draw_text_color(_x +1, _y -1, _text, c_black, c_black, c_black, c_black, _alpha*_alpha);
	draw_text_color(_x +1, _y +1, _text, c_black, c_black, c_black, c_black, _alpha*_alpha);

	draw_text_color(_x, _y, _text, _color, _color, _color, _color, _alpha);
}