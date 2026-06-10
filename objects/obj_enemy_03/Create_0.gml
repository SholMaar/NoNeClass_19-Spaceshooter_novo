// mudando vida do inimigo
enemy_life = 10;

// controle
index_default_shoot		= 0;
boolean_control			= false;
stretch_and_squash_variable();
blink_variable();
time_blink_effect		= time_blink;
shoot_sound				= snd_enemy03_shoot;
shoot_sound02			= snd_enemy03_charge_shoot;

// estado da maquina de estado
state_machine = "advance"
choose_state = noone;

// alarmes
time_switch_state	= game_get_speed(gamespeed_fps) *2;
alarm_switch_state	= time_switch_state;

time_deafult_shoot	= game_get_speed(gamespeed_fps) /3;
alarm_deafult_shoot	= time_deafult_shoot;

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
			choose_state = choose("stopped", "advance_right", "advance_left", "advance_middle", "leavy", "default_shoot", "power_shoot");
			// trocando estado para avanço
			state_machine		= choose_state
			// reiniciando alarme
			alarm_switch_state	= time_switch_state;
			// resetando indices
			index_default_shoot = 0;
			boolean_control		= false;
		}
	}

	case_stopped = function()
	{
		// zerando todas as minhas velocidades 
		vspeed	= 0;
		hspeed	= 0;
		speed	= 0;
	}

	case_advance = function()
	{
		// avançando para dentro da room
		var _outside_vroom	= 0 +sprite_height/2;
		var _destiny		= room_height/4;
				
		if (y < _outside_vroom)
			vspeed = 3;	// aumentando minha velocidade vertical
		else if (y >= _destiny)
			vspeed = 0; // zero minha velocidade
	}

	case_advance_direction = function(_direction)
	{
		// avançando para a direita
		var _destiny_right = _direction;
		x = lerp(x, _destiny_right, .2);
	}
	
	case_default_shoot = function()
	{
		// só funciona se o player está vivo
		if (instance_exists(obj_player))
		{
			// pegando direção do player
			var _player = obj_player;
			var _player_direction = point_direction(x, y, _player.x, _player.y)
					
			// correndo alarme para criar os 3 tiros
			if (alarm_deafult_shoot > 0 && index_default_shoot <3)
				alarm_deafult_shoot --;
			else if (alarm_deafult_shoot <= 0 && index_default_shoot <3)
			{
				// tocando som
				// verificando se tem algum outro audio do mesmo tipo
				audio_stop_sound(shoot_sound);
				audio_play_sound(shoot_sound, 2, 0, 2);
				// criando tiro
				var _default_shoot = instance_create_layer(x, y, "enemy_shoot", obj_shoot02_enemy_03);
				_default_shoot.direction	= _player_direction;
				_default_shoot.image_angle	= _player_direction +90;
				// resetando alarme e aumentando indice
				alarm_deafult_shoot = time_deafult_shoot;
				index_default_shoot++;
				
				stretch_and_squash();
			}
			// trocando estado
			if (index_default_shoot >= 3)
				switch_state();
		}
	}
	
	case_power_shoot = function()
	{
		// criando somente um disparo
		if (!boolean_control)
		{
			// tocando som
			// verificando se tem algum outro audio do mesmo tipo
			audio_stop_sound(shoot_sound02);
			audio_play_sound(shoot_sound02, 2, 0);
			// criando disparo
			instance_create_layer(x, y, "enemy_shoot", obj_shoot01_enemy_03);
			boolean_control = true;
			
			stretch_and_squash();
		}else // corro o alarme para ficcar um tempo parado
			alarm_switch_state--;
				
		// troco de estado
		if (alarm_switch_state <= 0)
			switch_state();
	}
	
	case_leavy = function()
	{
		// escolhendo uma direção uma única vez
		if (!boolean_control)
		{
			hspeed  = choose(-1, 1)*5;
			boolean_control = true;
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
			
			case "default_shoot":
				case_default_shoot();
			break;
				
			case "power_shoot":
				case_power_shoot();
			break;
			
			case "leavy":
				case_leavy();
			break;
		}
	}
#endregion