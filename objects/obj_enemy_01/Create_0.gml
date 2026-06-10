#region variaveis
	// padrao
	enemy_life = 1;
	
	 //alarmes
		// disparo
		time_enemy_01_shooting	= game_get_speed(gamespeed_fps) *2
		alarm_enemy_01_shooting	= time_enemy_01_shooting;	
	
	//controle
		// verificando se fui criado por uma sequencia
		creat_in_sequence	= in_sequence; 
		time_blink_effect	= time_blink;
		shoot_sound			= snd_enemy_shoot
		
	// efeitos
	stretch_and_squash_variable();
	blink_variable();
	
#endregion

#region metodos
	// metodo de atirar
	enemy_01_shooting = function(_shoot)
	{
		// correndo alarme
		alarm_enemy_01_shooting --;
		
		// verificando alarme 
		if (alarm_enemy_01_shooting <= 0)
		{
			// criando tiro só se o objeto existe
			if (object_exists(_shoot))
			{
				// tocando som
				// verificando se tem algum outro audio do mesmo tipo
				audio_stop_sound(shoot_sound);
				audio_play_sound(shoot_sound, 2, 0);
				// criando tiro
				instance_create_layer(x, y, "enemy_shoot", _shoot);
				// reiniciando alarme
				time_enemy_01_shooting	= game_get_speed(gamespeed_fps) *irandom_range(1, 3);
				alarm_enemy_01_shooting = time_enemy_01_shooting;
				
				// efeito
				stretch_and_squash();
			}
		}
	}
#endregion