#region variaveis
	// velocidades
	vel_player				= 5; // velocidade movimento
	
	// controles
	select_shoot			= 01;
	active_shield			= false;
	damage_cooldown			= false;
	stretch_and_squash_variable();
	blink_variable();
	
	// vidas do jogador
	max_player_life			= 3;
	current_player_life		= max_player_life;
	// escudos do jogador
	max_player_shield		= 3;
	current_player_shield	= max_player_shield;
#endregion

#region alarmes
	// alarme para intervalos no disparo
	time_player_shooting	= game_get_speed(gamespeed_fps) /5; // intervalo de disparo
	alarm_player_shoot		= 0;
	// alarme para cooldown
	time_damage_cooldown	= game_get_speed(gamespeed_fps) *3;
	alarm_damage_cooldown	= time_damage_cooldown;
#endregion

#region métodos
	// criando metodo de controle do player
	player_control = function()
	{	
		#region movimentação
			// só vou me mover se eu não estiver em uma sequencia 
			if in_sequence exit;
			
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
			
			// movimentação para mobile
			var _mouse_press = mouse_check_button(mb_left);
			if (_mouse_press)
			{
				// me movendo de cordo com meu mouse
				x = lerp(x, mouse_x, .1);
				y = lerp(y, mouse_y, .1);
			}
			
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
			else if _shoot && alarm_player_shoot <= 0 // atirando
			{
				// resetando o alarme de disparo
				alarm_player_shoot = time_player_shooting;
				// som
				play_sound(, , , .3);
			}
		#endregion		
		
		#region escudo
			// tecla de criar escudo
			var _activate_shield = keyboard_check_released(ord("E")) || keyboard_check_released(vk_control);
			// criando escudo somente se eu tenho escudos para criar
			if (_activate_shield && current_player_shield > 0 && !active_shield)
			{
				// criando escudo
				if (object_exists(obj_player_shield)) // somente se esse objeto existe
				{
					// falando que meu escudo está ativo
					active_shield = true;
					// gastando meu escudo
					current_player_shield --;
					// garantindo que o joagdor não vai receber dano nenhum
					damage_cooldown = true; // isso impede ele de tomar qualquer dano
					// criando escudo
					instance_create_layer(x, y, "player_shield", obj_player_shield);
					// tocando som
					play_sound(snd_player_shild, 3);
				}
			}
			
			// verificando se o escuto esta no jogo para saber se ele está ativo ou não
			if (!instance_exists(obj_player_shield))
				active_shield = false; // se meu escudo não exite, então eu posso ativar ele
		#endregion
		
		#region controle de dano
			// verificando se estou no cooldown e se estou com escudo ativo
			if (damage_cooldown && !active_shield)
			{
				// ficando meio transparente
				image_alpha = .7;
				alarm_damage_cooldown--; // correndo alarme do cooldown
			}
			
			// verificando alarme do cooldown
			if (alarm_damage_cooldown <= 0)
			{
				// vvoltando transparencia
				image_alpha = 1;
				// voltando a tomar dano 
				damage_cooldown = false;
				// resetando alarme
				alarm_damage_cooldown = time_damage_cooldown;
			}
		#endregion
		
		#region padrão
			default_scale();
			default_color();
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
				// animação
				stretch_and_squash();
				
				// criar tiro
				var _y = y -sprite_height/2;
				instance_create_layer(x, _y, "player_shoot", obj_player_shoot);
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
				// animação
				stretch_and_squash();
				
				// variavel para guardar posição do tiro
				var _pos_x_shoot = x -10;
				var _y = y -sprite_height/2;
				
				// criando tiro
				repeat(2) // repetindo esse código duas vezes
				{
					// criando um tiro na esquerda e outro na direita
					var _player_shoot = instance_create_layer(_pos_x_shoot, _y, "player_shoot", obj_player_shoot);
					_pos_x_shoot = x +10; // mudando a posição x do meu tiro secundario
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
	
	// metodo para perder vida e morrer
	player_lose_life = function(_damege =1)
	{
		if damage_cooldown exit // se estou na espera de dano, eu não recebo dano algum
		
		screenshack();	// tremendo tela
		time_blink();	// iniciando piscada
		
		current_player_life -=_damege;			// perdendo vida
		play_sound(snd_player_shot, 4);	// tocando som de perer vida
		
		// morrendo
		if (current_player_life < 0)
		{
			instance_create_layer(x, y, "particles", obj_player_explosion);	// criando animação
			instance_destroy()	// me destruindo
			
			audio_stop_sound(snd_music);	// parando minha música
			play_sound(snd_gameover, 5);	// tocando som de fim de jogo
		}
		
		damage_cooldown = true; // ativando invencibilidade
	}
	
#endregion