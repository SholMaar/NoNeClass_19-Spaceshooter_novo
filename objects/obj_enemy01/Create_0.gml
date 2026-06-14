#region variaveis
	// padrao
		enemy_life = 1;
		
	// sons
		shot_sound	= snd_enemy_shot;

	 //alarmes
		// disparo
			time_enemy01_shot	= game_get_speed(gamespeed_fps) *choose(2, 2.5, 3);
			alarm_enemy01_shot	= time_enemy01_shot;	
	
	// efeitos
		blink_variable();					// variaveis para piscar
		time_blink_effect = time_blink;		// tempo de duração da piscada
		stretch_and_squash_variable();		// variaveis para animação
		start_end_animation_variables();	// variaveis para animação de encerramento
	
	//controle
		creat_in_sequence	= in_sequence; // verificando se fui criado por uma sequencia
	
#endregion

#region metodos
	// metodo de atirar
	enemy01_shot = function(_shot)
	{
		if !instance_exists(obj_player) exit;	// se o jogador não existe não tem em quem atirar
		alarm_enemy01_shot --;					// correndo alarme
		
		// verificando alarme 
		if (alarm_enemy01_shot <= 0)
		{
			// criando tiro só se o objeto existe
			if (object_exists(_shot))
			{
				play_sound(shot_sound, 2, , .5, .5, 1.4);			// tocando som
				instance_create_layer(x, y, "enemy_shot", _shot);	// criando tiro
				
				// reiniciando alarme
				time_enemy01_shot	= game_get_speed(gamespeed_fps) *choose(2, 2.5, 3.5);
				alarm_enemy01_shot = time_enemy01_shot;
				
				// efeito
				stretch_and_squash();
			}
		}
	}
	
#endregion