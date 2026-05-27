draw_ui_player = function()
{
	// vida do jogador
	var _x_display, _y_display, _x_display_distance;
	_x_display			= display_get_gui_width();
	_y_display			= display_get_gui_height();
	_x_display_distance = 1;

	// desenhando as informações do jogador
	// desenhando de acordo com o numero atual de vidas do jogador
	var _current_player_life	= global.player_current_life_gui;
	// só desenho se eu tenho vidasa para desenhar 
	if (_current_player_life > 0)
	{
		repeat(_current_player_life)
		{
			// desenhando sprites da vida
			draw_sprite_ext(spr_gui_player_life, 0, 20 *_x_display_distance, _y_display -40, 1.5, 1.5, 0, c_white, .7);
			// atualizando distancia conforme se repete
			_x_display_distance += 2;
		}
	}

	// voltando minha variavel de distancia para o valor pardrão
	_x_display_distance = 1;

	// desenhando escudos disponiveis do jogador 
	var _current_player_shield = global.player_current_shield_gui;
	// só desenhos os escudos se eu tenho escudos para desenhar
	if (_current_player_shield > 0)
	{
		repeat(_current_player_shield)
		{
			// desenhando sprites do escudo
			draw_sprite_ext(spr_gui_player_shield, 0, _x_display -20 *_x_display_distance, _y_display -40, 1.5, 1.5, 0, c_white, .7);
			// atualizando distancia 
			_x_display_distance += 2;
		}
	}
}