// aumentando meu taanho 
image_xscale = 1.5;
image_yscale = image_xscale;

#region variaveis
	// tempo
	active_shield_time	= game_get_speed(gamespeed_fps) *8;
	alarm_active_shield	= active_shield_time;
#endregion

#region metodos
	// controlar animação
	control_shield = function()
	{
		#region animação
			// parando meu escudo no ultimo frame
			if (image_index >= image_number-1)
				image_speed = 0; // parando a velocidade de animação 
		#endregion
		
		#region tempo
			// controle de tempo de atividde do escudo
			if (alarm_active_shield <= 0)
			{
				// voltando a animação para me destruir
				image_speed = -.5;
				if (image_speed < 0 && image_index <= 0)
				{
					// me destruindo
					instance_destroy();
				}
			}else // só corro o alarme se ele for maior que 0
			{
				// correndo alarme
				alarm_active_shield--;
			}
		#endregion
	}
#endregion