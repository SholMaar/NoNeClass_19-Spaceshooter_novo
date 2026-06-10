#region variaveis
	function start_end_animation_variables()
	{
		time_animation_end_game		= game_get_speed(gamespeed_fps) *random_range(.8, 1.2);
		alarm_animation_end_game	= time_animation_end_game;
	}
#endregion

#region metodos
	// animação de fim de jogo do inimigo
	function animation_enemy_endgame()
	{
		// só é feita quando o player morrer
		if (!instance_exists(obj_player) && !in_sequence)
		{
			alarm_animation_end_game --;		// descendo alarme
			//quando o alarme chegar em zero 
			if (alarm_animation_end_game > 0)
				y -= irandom_range(1, 2.5);		// subo um pouco as naves
			else
				y += irandom_range(10, 30);		// depois elas descem com tudo
		 }
		 
		 // garantindo que eu não vou ocupar espaço na memoria
		 if (y > room_height +sprite_height)
			instance_destroy(id, false);		//  me destruindo
	}
	
	// animação de velocidade do disparo
#endregion