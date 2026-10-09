#region variaveis
	// velocidades
		start_vel_shot(0);
		
	// efeito
		light_color = c_red; // cor do brilho
		load = 0; // por padrão load é falso
#endregion

#region metodos
	// controle do tiro
	enemy01_shot_control = function()
	{
		speed_shot(5, .3);
		
		// evitando que o tiro continue existindo após sair da room
		var _outside_vroom = room_height + sprite_height/2;
		if (y > _outside_vroom)
			instance_destroy(id, false); // não execute nada no evento de destruição
	}
#endregion