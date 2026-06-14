// desenhando brilho
gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale *1.5, image_yscale *1.5, image_angle, c_fuchsia, .7);
gpu_set_blendmode(bm_normal);

// me desenhando por cima do brilho
draw_self();