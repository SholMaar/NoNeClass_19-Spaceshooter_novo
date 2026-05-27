#region variaveis
	// velocidades
	vel_player				= 4; // velocidade movimento
	time_player_shooting	= game_get_speed(gamespeed_fps) /5; // intervalo de disparo
	
	// controles
	select_shoot			= 01;
	// vidas do jogador
	max_player_life			= 3;
	current_player_life		= max_player_life;
	// escudos do jogador
	max_player_shield		= 3;
	current_player_shield	= max_player_shield;
#endregion

#region alarmes
// alarme para intervalos no disparo
alarm_player_shoot = 0;
#endregion

#region métodos
	// criando metodo de controle do player
	player_control = function()
	{	
		#region movimentação
			// variaveis para pegar teclas do teclado
			var _up, _down, _left, _right;
			// atribuindo teclas
			// movimentação
			_up		= keyboard_check(ord("W")) || keyboard_check(vk_up);
			_left	= keyboard_check(ord("A")) || keyboard_check(vk_left);
			_down	= keyboard_check(ord("S")) || keyboard_check(vk_down);
			_right	= keyboard_check(ord("D")) || keyboard_check(vk_right);
			
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
		
			// evitando que o player saia da room
			// eixo x
			var _min_clamp_x, _max_clamp_x;
			_min_clamp_x = 0 +sprite_width/2;
			_max_clamp_x = room_width -sprite_width/2;
			x = clamp(x, _min_clamp_x, _max_clamp_x);
			// eixo y
			var _min_clamp_y, _max_clamp_y;
			_min_clamp_y = 0 +sprite_height/2;
			_max_clamp_y = room_height -sprite_height/2;
			y = clamp(y, _min_clamp_y, _max_clamp_y);
		#endregion
		
		#region atirar
			// variavel tecla de tiro
			var _shoot = keyboard_check(vk_space) || mouse_check_button(mb_left);
			
			// selecionando tiro atual
			switch(select_shoot)
			{
				case 01: // level 1 de tiro
					player_shoot_level01();
				break;
				case 02: // level 2 do tiro
					player_shoot_level02();
				break;
				case 03: // level 03 de tiro
					player_shoot_level03();
				break;
				
				default: // caso não encontre valor correto
					player_shoot_level01(); // eu volto para o tiro 1
				break;
			}
			
			// controlando o alarme para evitar spam
			if alarm_player_shoot > 0
				alarm_player_shoot--;
			else if _shoot && alarm_player_shoot <= 0
				// resetando o alarme de disparo
				alarm_player_shoot = time_player_shooting;
		#endregion		
	}
	
	// metodos de tiro do jogador
	#region leveis de tiro
		// tiro de level 01
		player_shoot_level01 = function()
		{
			// tecla de atirar
			var _shoot = keyboard_check(vk_space) || mouse_check_button(mb_left);
			// atirando se eu apertei para atirar e meu alarme permitir
			if _shoot && alarm_player_shoot <= 0
			{
				var _player_shoot = instance_create_layer(x, y, "player_shoot", obj_player_shoot);
				//aplicando direção
				// verificando se o tiro foi criado
				if instance_exists(_player_shoot)
				_player_shoot.vspeed = _player_shoot.vel_player_shoot;
			}
		}
		
		// tieo de level 02
		player_shoot_level02 = function()
		{
			// tecla de atirar
			var _shoot = keyboard_check(vk_space) || mouse_check_button(mb_left);
			// atirando se eu apertei para atirar e meu alarme permitir
			if _shoot && alarm_player_shoot <= 0
			{
				// variavel para guardar posição do tiro
				var _pos_x_shoot = x -10;
				
				// criando tiro
				repeat(2) // repetindo esse código duas vezes
				{
					// criando um tiro na esquerda e outro na direita
					var _player_shoot = instance_create_layer(_pos_x_shoot, y, "player_shoot", obj_player_shoot);
					_pos_x_shoot = x +10; // mudando a posição x do meu tiro secundario
					
					//aplicando direção
					// verificando se o tiro foi criado
					if instance_exists(_player_shoot)
					_player_shoot.vspeed = _player_shoot.vel_player_shoot;
				}
			}
		}
		
		// tiro de level 03
		player_shoot_level03 = function()
		{
			// criando o tiro e o tiro 1 e 2 ao mesmo tempo
			player_shoot_level01();
			player_shoot_level02();
		}
	#endregion
	
	// metodo para ganhar level
	player_levelup = function()
	{
		select_shoot++;
	}
#endregion