if global.hitstop exit; // executanfo hitstop

player_shot_control(); // controles do tiro

// animação
	image_xscale = lerp(image_xscale, 1, .2);			// mexendo na escla
	image_yscale = lerp(image_yscale, 1, .2);

	speed_shot(-20, .3);
	

// criando rastro
instance_create_depth(x, y, depth, obj_trail);