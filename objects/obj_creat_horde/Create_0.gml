#region variaveis
	// vetores
		enemy_01_horde_array = [sq_horde01, sq_horde02, sq_horde03, sq_horde04, 
		sq_horde05, sq_horde06, sq_horde07, sq_horde08, sq_horde09, sq_horde_loop01,
		sq_horde_loop02, sq_horde_loop03, sq_horde_loop04];
	
	// controle
		index_horde = 0;
		
	// alarmes
		time_creat_horde01		= game_get_speed(gamespeed_fps) *4;
		alarm_creat_horde01		= time_creat_horde01;
			// iniciar primeira horda
			alarm_start_horde	= time_creat_horde01;
	
#endregion

#region metodos
	// horda de inimigos01
	enemy_01_horde = function()
	{
		// somente se o player existir
		if (!instance_exists(obj_player)) exit;
		
		// cooldown para iniciar
		if (alarm_start_horde > 0)
			alarm_start_horde --;	// correndo alarme
		else
		{
			// corrndo alarme
			if (alarm_creat_horde01 > 0)
				alarm_creat_horde01 --;	// correndo alarme
			// criando hordas conforme meu index
			if (alarm_creat_horde01 <= 0  && !instance_exists(obj_enemy01))
			{
				layer_sequence_create("horde_sequence", 0, 0, enemy_01_horde_array[index_horde]);	// criando a horda
				
				alarm_creat_horde01 = time_creat_horde01;	//resetando alarme
				index_horde++;								// aumentando o valor do index
				
				// impedindo indice de ultrapassar limite
				if (index_horde > array_length(enemy_01_horde_array)-1)
					index_horde = 0;
			}
		}
	}
#endregion