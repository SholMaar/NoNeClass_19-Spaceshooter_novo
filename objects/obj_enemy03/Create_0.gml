#region variaveis
	// mudando vida do inimigo
		enemy_life = 10;

	// controle
		index_default_shot		= 0;
		boolean_control			= false;
		shot_sound				= snd_enemy03_shot;
		shot_sound02			= snd_enemy03_charge_shot;
		dir						= choose(45, 135, 225, 270);

	// velocidades
		velv_enemy03	= 3;
		velh_enemy03	= 0;
		vel_enemy03		= 3;
	

	// efeitos
		blink_variable();					// variaveis para piscar
		time_blink_effect = time_blink;		// tempo de duração da piscada
		stretch_and_squash_variable();		// variaveis para animação
		start_end_animation_variables();	// variaveis para animação de encerramento

	// estado da maquina de estado
	state_machine = "leavy"
	choose_state = noone;

	// alarmes
	time_switch_state	= game_get_speed(gamespeed_fps) *2;
	alarm_switch_state	= time_switch_state;

	time_deafult_shot	= game_get_speed(gamespeed_fps) /3;
	alarm_deafult_shot	= time_deafult_shot;
#endregion

#region metodos
	// troca de estados
	switch_state = function()
	{
		// correndo alarme
		if (alarm_switch_state > 0)
			alarm_switch_state--;
		//saindo do meu estado atual
		else
		{
			choose_state = choose("stopped", "advance_right", "advance_left", "advance_middle", "leavy", "default_shot", "power_shot");
			// trocando estado para avanço
			state_machine		= choose_state
			// reiniciando alarme
			alarm_switch_state	= time_switch_state;
			// resetando indices
			index_default_shot = 0;
			boolean_control		= false;
		}
	}

	case_stopped = function()
	{
		// zerando todas as minhas velocidades 
		velv_enemy03	= 0;
		velh_enemy03	= 0;
		vel_enemy03		= 0;
	}

	case_advance = function()
	{
		// avançando para dentro da room
		var _destiny		= room_height/6;
				
		if (y < _destiny )
			y += velv_enemy03;	// aumentando minha velocidade vertical
	}

	case_advance_direction = function(_direction)
	{
		// avançando para a direita
		var _destiny_right = _direction;
		x = lerp(x, _destiny_right, .2);
	}
	
	case_default_shot = function()
	{
		// só funciona se o player está vivo
		if (instance_exists(obj_player))
		{
			// pegando direção do player
			var _player = obj_player;
			var _player_direction = point_direction(x, y, _player.x, _player.y)
					
			// correndo alarme para criar os 3 tiros
			if (alarm_deafult_shot > 0 && index_default_shot <3)
				alarm_deafult_shot --;
			else if (alarm_deafult_shot <= 0 && index_default_shot <3)
			{
				// tocando som
				play_sound(shot_sound, 2, , .5);
				// criando tiro
				var _default_shot = instance_create_layer(x, y, "enemy_shot", obj_enemy03_shot);
				_default_shot.direction	= _player_direction;
				_default_shot.image_angle	= _player_direction +90;
				// resetando alarme e aumentando indice
				alarm_deafult_shot = time_deafult_shot;
				index_default_shot++;
				
				stretch_and_squash();
			}
			// trocando estado
			if (index_default_shot >= 3)
				switch_state();
		}
	}
	
	case_power_shot = function()
	{
		// criando somente um disparo
		if (!boolean_control)
		{
			// tocando som
			play_sound(shot_sound02, 3, , .6);
			// criando disparo
			instance_create_layer(x, y, "enemy_shot", obj_enemy03_charge_shot);
			boolean_control = true;
			
			stretch_and_squash();
		}else // corro o alarme para ficcar um tempo parado
			alarm_switch_state--;
				
		// troco de estado
		if (alarm_switch_state <= 0)
			switch_state();
	}
	
	case_leavy = function(_dir)
	{
		// escolhendo uma direção uma única vez
		if (!boolean_control)
		{
			x += lengthdir_x(vel_enemy03, _dir); 
			y += lengthdir_y(vel_enemy03, _dir); 
		}
				
		// me destruindo ao sair da room
		var _outside_room_right = room_width +sprite_width/2
		var _outside_room_left	= 0 -sprite_width/2
		if (x >= _outside_room_right || x <= _outside_room_left)
			instance_destroy(id, false);
	}
	
	// maquina de estados
	state_machine_enemy03 = function()
	{
		// só faço meus estados se tiver player
		if (!instance_exists(obj_player)) exit;
		// usando switch 
		switch state_machine
		{			
			case "advance":
				case_advance();
				// trocando estado
				switch_state();
			break;
			
			case "stopped": // parado
				case_stopped();
				// trocando de estado
				switch_state();
			break;
			
			case "advance_right":
				// avançando para a esquerda
				case_advance_direction(room_width -64);
				// mudnado de estado
				switch_state();
			break;
			
			case "advance_middle":
				// avançando para a direita
				case_advance_direction(room_width/2);
				// mudnado de estado
				switch_state();
			break;
			
			case "advance_left":
				// avançando para a direita
				case_advance_direction(0 +64);
				// mudnado de estado
				switch_state();
			break;
			
			case "default_shot":
				case_default_shot();
			break;
				
			case "power_shot":
				case_power_shot();
			break;
			
			case "leavy":
				case_leavy(dir);
			break;
		}
	}
#endregion