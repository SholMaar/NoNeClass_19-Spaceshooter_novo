#region // Variaveis Globais
	//Player
	// vidas atuais
	global.player_current_life_gui		= 0;
	global.player_current_shield_gui	= 0;
#endregion

#region metodos
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
	
	// função para tremer a tela
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
	
	// função para tocar sons no jogo
	function play_sound(_snd=snd_player_shot, _prt=1, _loop=0, _gain=1, _pval01=.8, _pval02=1.3)
	{
		audio_stop_sound(_snd);									// impedindo de ter cacofonia
		var _pitch = 1 *random_range(_pval01, _pval02);			// variação de pitch
		audio_play_sound(_snd, _prt, _loop, _gain, 0, _pitch);	// tocando som
	}

#endregion