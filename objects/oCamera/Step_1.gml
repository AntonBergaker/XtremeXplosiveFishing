
if (os_browser != browser_not_a_browser) {
	var targetWidth;
	var targetHeight;
	
	if (browser_width < 1600 || browser_height < 900) {
		if (browser_width < browser_height*ratio) {
			targetWidth = browser_width;
			targetHeight = browser_width/ratio;
		} else {
			targetWidth = browser_height*ratio;
			targetHeight = browser_height;
		}
	} else {
		targetWidth = 1600;
		targetHeight = 900;
	}
	
	if (lastHeight != targetHeight || lastWidth != targetWidth) {
		
		surface_resize(application_surface, targetWidth, targetHeight);
		window_set_size(targetWidth, targetHeight);
		view_wport[0] = targetWidth;
		view_hport[0] = targetHeight;
		
		lastWidth = targetWidth;
		lastHeight = targetHeight;
		
		display_set_gui_size(1600, 900);
	}
}
