#region variaveis
	// padrao
		enemy_life = 1;
	
	 //alarmes
		// disparo
		time_enemy_01_shooting	= game_get_speed(gamespeed_fps) *choose(.5, 2, 2.5);
		alarm_enemy_01_shooting	= time_enemy_01_shooting;	
		
		// end game
		start_end_animation_variables();
		
	//controle
		creat_in_sequence	= in_sequence; // verificando se fui criado por uma sequencia
		time_blink_effect	= time_blink;
		shoot_sound			= snd_enemy_shoot;
		
	// efeitos
	stretch_and_squash_variable();
	blink_variable();
	
#endregion

#region metodos
	// metodo de atirar
	enemy_01_shooting = function(_shoot)
	{
		if !instance_exists(obj_player) exit;	// se o jogador não existe não tem em quem atirar
		alarm_enemy_01_shooting --;				// correndo alarme
		
		// verificando alarme 
		if (alarm_enemy_01_shooting <= 0)
		{
			// criando tiro só se o objeto existe
			if (object_exists(_shoot))
			{
				play_sound(shoot_sound, 2, , .5, .5, 1.4);			// tocando som
				instance_create_layer(x, y, "enemy_shoot", _shoot);	// criando tiro
				
				// reiniciando alarme
				time_enemy_01_shooting	= game_get_speed(gamespeed_fps) *irandom_range(1, 3);
				alarm_enemy_01_shooting = time_enemy_01_shooting;
				
				// efeito
				stretch_and_squash();
			}
		}
	}
	
#endregion