#region variaveis
	#region alarmes
		// disparo
		time_enemy_01_shooting	= game_get_speed(gamespeed_fps) *2
		alarm_enemy_01_shooting	= time_enemy_01_shooting;	
	#endregion
	
	#region controle
		// verificando se fui criado por uma sequencia
		creat_in_sequence = in_sequence; 
	#endregion
#endregion

#region metodos
	// metodo de atirar
	enemy_01_shooting = function()
	{
		// correndo alarme
		alarm_enemy_01_shooting --;
		
		// verificando alarme 
		if (alarm_enemy_01_shooting <= 0)
		{
			// criando tiro só se o objeto existe
			if (object_exists(obj_shoot_enemy_01))
			{
				// criando tiro
				instance_create_layer(x, y, "enemy_shoot", obj_shoot_enemy_01);
				// reiniciando alarme
				time_enemy_01_shooting	= game_get_speed(gamespeed_fps) *irandom_range(1, 3);
				alarm_enemy_01_shooting = time_enemy_01_shooting;
			}
		}
	}
#endregion