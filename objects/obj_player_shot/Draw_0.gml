draw_self();

// desenhando meu efeito de brilho
gpu_set_blendmode(bm_add); // alterando processamento da gpu
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale *1.5, image_yscale *1.5, image_angle, c_ltgray, .7);
gpu_set_blendmode(bm_normal);