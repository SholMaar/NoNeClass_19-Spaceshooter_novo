force = 0;

screen_shack = function()
{	
	// fazendo a tela tremer
	if (force > 0.1)
	{
		// variavel para tremer
		var _shack_x = random_range(force, -force);	
		var _shack_y = random_range(force, -force);
		
		// pegando a posição da viewport
		view_set_xport(view_current, _shack_x);
		view_set_yport(view_current, _shack_y);
	}else
	{	// garantindo que fique zerado
		force = 0;
		// resetando viewport
		view_set_xport(view_current, 0);
		view_set_yport(view_current, 0);
		// me destruindo
		instance_destroy();
	}
	// diminuindo a força
	force = lerp(force, 0, .05);
}