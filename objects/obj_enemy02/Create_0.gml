#region
	// padrão
		enemy_life = 5;
	
	// sons
		shot_sound	= snd_enemy_shot;
		
	// controle
		creat_in_sequence = in_sequence;
		
	// alarmes
		// disparo
		time_enemy01_shot	= game_get_speed(gamespeed_fps) *choose(2, 3);
		alarm_enemy01_shot	= time_enemy01_shot;	
		
	// efeitos
		blink_variable();					// variaveis para piscar
		time_blink_effect = time_blink;		// tempo de duração da piscada
		stretch_and_squash_variable();		// variaveis para animação
		start_end_animation_variables();	// variaveis para animação de encerramento
#endregion

#region metodos
	// metodo de atirar
	enemy02_shot = function(_shot, _time01, _time02)
	{
		if !instance_exists(obj_player) exit;	// se o jogador não existe não tem em quem atirar
		alarm_enemy01_shot --;					// correndo alarme
		
		// verificando alarme 
		if (alarm_enemy01_shot <= 0)
		{
			// criando tiro só se o objeto existe
			if (object_exists(_shot))
			{
				play_sound(shot_sound, 2, , .5, .2, .5);	// tocando som
				
				var _direction = 255; // variavel para mudar a direção do disparo
				repeat(3)
				{
					var _instance_shot = instance_create_layer(x, y, "enemy_shot", _shot);	// criando tiro
					_instance_shot.direction	= _direction;		// arrumando direção do disparo				
					_instance_shot.image_angle	= _direction +90;	// arrumando angulo do disparo
					_direction += 15; // aumentando o angulo de disparo
				}
				_direction = 255; // resetando a variavel de direção
				
				// reiniciando alarme
				time_enemy01_shot	= game_get_speed(gamespeed_fps) *random_range(_time01, _time02);
				alarm_enemy01_shot	= time_enemy01_shot;
				
				// efeito
				stretch_and_squash();
			}
		}
	}

#endregion