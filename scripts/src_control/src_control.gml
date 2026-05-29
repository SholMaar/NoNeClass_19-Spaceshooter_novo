#region // Variaveis Globais
	//Player
	// vidas atuais
	global.player_current_life_gui		= 0;
	global.player_current_shield_gui	= 0;
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
#endregion