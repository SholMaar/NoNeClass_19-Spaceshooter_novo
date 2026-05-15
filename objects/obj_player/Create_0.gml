#region variaveis
	vel_player	= 4;
#endregion

#region métodos
	// criando metodo de controle do player
	player_control = function()
	{
		// variaveis para pegar teclas do teclado
		var _up, _down, _left, _right, _shoot;
		// atribuindo teclas
		// movimentação
		_up		= keyboard_check(ord("W")) || keyboard_check(vk_up);
		_left	= keyboard_check(ord("A")) || keyboard_check(vk_left);
		_down	= keyboard_check(ord("S")) || keyboard_check(vk_down);
		_right	= keyboard_check(ord("D")) || keyboard_check(vk_right);
		// atirar
		_shoot = keyboard_check(vk_space) || mouse_check_button(mb_left);
		
		// variaveis de para velocidade vertical e horizontal
		var _velv_player = 0;
		var _velh_player = 0;
		
		// fazendo a movimentação
		// vertical
		_velv_player = (_up -_down) *vel_player;
		y -= _velv_player;
		// horizontal
		_velh_player = (_left -_right) *vel_player;
		x -= _velh_player; 
		
		// atirando
		if _shoot
		{
			var _player_shoot = instance_create_layer(x, y, "player_shoot", obj_player_shoot);
			//aplicando direção
			// verificando se o tiro foi criado
			if instance_exists(_player_shoot)
			_player_shoot.vspeed = -5;
		}
	}
#endregion