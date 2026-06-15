#region variaveis
	// fim de jogo
		time_endgame	= game_get_speed(gamespeed_fps) *3;
		alarm_endgame	= time_endgame;
#endregion

#region metodos
	// criando o jogador 
	start_player = function()
	{
		layer_sequence_create("intro", 0, 0, sq_player_intro);
	}
#endregion

#region chamada de metodos
	start_player();
#endregion