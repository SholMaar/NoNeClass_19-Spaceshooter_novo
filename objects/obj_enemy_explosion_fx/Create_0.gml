// crontrole
control_enemy_explosion_fx = function()
{
	// arrumando tamanho
	image_xscale = .5;
	image_yscale = image_xscale;
	// me destruindo no fim da animação
	var _end_animation = image_index >= image_number-1;
	if (_end_animation)
		instance_destroy();
}