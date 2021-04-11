if (inWater) {
	phy_speed_x *= 0.5;
	phy_speed_y *= 0.5;
} else {
	begin_decay();
}