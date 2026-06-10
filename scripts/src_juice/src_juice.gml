#region iniciar variaeis
	// stretch_and_squash
	function stretch_and_squash_variable()
	{
		// iniciando variaveis
		xscale_control			= 1;
		yscale_control			= 1;
	}
	
	// piscar em branco
	function blink_variable()
	{
		damege	= 0;
	}
	
	// velocidade de disparo
	function start_vel_shot(_vel)
	{
		vel_shot = _vel;
	}
#endregion

#region efeitos
	// criar particula
	function creat_particle(_particle)
	{
		if object_exists(_particle)
			instance_create_layer(x, y, "particles", _particle);
	}

	#region stretch_and_squash
		function stretch_and_squash(_x = 1.3, _y = 0.8)
		{
			var _exist_variable01 = variable_instance_exists(id, "xscale_control");
			var _exist_variable02 = variable_instance_exists(id, "yscale_control");
			// só faço se a variavel existir na instancia
			if (_exist_variable01 && _exist_variable02)
			{
				xscale_control = _x;
				yscale_control = _y;
			}else return;
		}
	
		function default_scale()
		{
			var _exist_variable01 = variable_instance_exists(id, "xscale_control");
			var _exist_variable02 = variable_instance_exists(id, "yscale_control");
			// só faço se a variavel existir na instancia
			if (_exist_variable01 && _exist_variable02)
			{
				// voltando para minha escala normal
				xscale_control = lerp(xscale_control, 1, .1);
				yscale_control = lerp(yscale_control, 1, .1);
			}else return;
		}
	#endregion
	
	#region pisca em branco
		function blink(_blink = true, _shader = sh_white_shader)
		{
			if _blink
			{
				var _exist_variable01 = variable_instance_exists(id, "damege");
				if (_exist_variable01)
				{
					if (damege)
					{
						// aplicando shader
						shader_set(_shader);

						// desenhando uma sprite no meu meu lugar, é a minha propria sprite
						// usando variaveis de controle para não afetar a hitbox 
						draw_sprite_ext(sprite_index, image_index, x, y, xscale_control, yscale_control, image_angle, image_blend, image_alpha);

						// resetando shaders
						shader_reset();
					}else
						// desenhando uma sprite no meu meu lugar, é a minha propria sprite
						// usando variaveis de controle para não afetar a hitbox 
						draw_sprite_ext(sprite_index, image_index, x, y, xscale_control, yscale_control, image_angle, image_blend, image_alpha);
				}else return;
			}else
				draw_self();
		}
		
		function time_blink(_time = 5)
		{
			var _exist_variable01 = variable_instance_exists(id, "damege");
			if (_exist_variable01)
			{
				// aplicando cor braca
				damege = _time;
			}else return;
		}
		
		function default_color()
		{
			var _exist_variable01 = variable_instance_exists(id, "damege");
			if (_exist_variable01)
			{
				// voltando a minhas cores
				if (damege > 0)
					damege--;
			}else return;
		}
	#endregion
	
	// velocidade do disparo
	function speed_shot(_vel, _time) 
	{
		vel_shot = lerp(vel_shot, _vel, _time);	// animando velocidade do disparo
		vspeed = vel_shot;
	}
#endregion