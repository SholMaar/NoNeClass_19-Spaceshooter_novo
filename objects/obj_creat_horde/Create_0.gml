#region variaveis
	// vetores
	enemy01_horde_array = [sq_enemy_01_horde03, sq_enemy_01_horde_02, sq_enemy_01_horde_01b, sq_enemy_01_horde_01];
	
	// controle
	index_horde = 0;
	
	// alarmes
	time_creat_horde01	= game_get_speed(gamespeed_fps) *3;
	alarm_creat_horde01	= time_creat_horde01;
#endregion

#region metodos
	// horda de inimigos01
	enemy01_horde = function()
	{
		// corrndo alarme
		if (alarm_creat_horde01 > 0)
			alarm_creat_horde01 --;
			
		// criando hordas conforme meu index
		if (alarm_creat_horde01 <= 0)
		{
			// criando a horda
			layer_sequence_create("horde_sequence", 0, 0, enemy01_horde_array[index_horde]);
			//resetando alarme
			alarm_creat_horde01 = time_creat_horde01;
			// aumentando o valor do index
			index_horde++;
			// impedindo indice de ultrapassar limite
			if (index_horde > array_length(enemy01_horde_array)-1)
				index_horde = 0;
		}
	}
#endregion