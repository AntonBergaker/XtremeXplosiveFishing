function get_random_water_position()/*->number[]*/ {
	while (true) {
		var xx = random_range(0, 1180);
		var yy = random_range(500, 900);
		if (point_in_triangle(xx, yy, 0, 500, 1180, 500, 0, 900)) {
			return [xx, yy];
			break;
		}
	}
}