#region // Variaveis Globais
	//Player
	// vidas atuais
	global.player_current_life_gui		= 0;
	global.player_current_shield_gui	= 0;
	
	// room
	global.next_room					= rm_inicio;
	
	// transição
	global.on_transition				= false;
#endregion

#region metodos
	// criar particula
	function creat_particle(_particle)
	{
		if object_exists(_particle)
			instance_create_layer(x, y, "particles", _particle);
	}
	
	// chance de criar drop
	function drop_chance(_dice_number, _difficult, _drop)
	{
		// verificando se o drop existe
		if !object_exists(_drop) exit;
		
		// dado de porcentagem
		var _dice = random(_dice_number);
		if (_dice >= _difficult)
			instance_create_layer(x, y, "powerup", _drop);
	}
	
	function screenshack(_force = 10)
	{
		// verificando se o objeto existe
		if (object_exists(obj_screenshack))
		{
			var _obj_screenshack = instance_create_layer(0, 0, "control", obj_screenshack);
			_obj_screenshack.force = _force;
			
			// dando prioridade a força maior
			with(obj_screenshack)
			{
				if (_force > force)
					force = _force;
			}
		}
	}
	
	function switch_room()
	{
		room_goto(global.next_room);
		global.on_transition = true;
	}
	
	function end_transition()
	{
		global.on_transition = false;	
	}
#endregion