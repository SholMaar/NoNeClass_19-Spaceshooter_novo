player_shoot_control(); // controles do tiro

// animação
	image_xscale = lerp(image_xscale, 1, .2);			// mexendo na escla
	image_yscale = lerp(image_yscale, 1, .2);

	speed_shot(-20, .3);
	