draw_gui_player = function(_sprite =spr_gui_player_shield, _global_p_ui = global.player_current_shield_gui,
_x_display_distance = 1, _x_display = 0, _pos_x = "right")
{
	// verificando se estou na esqueda ou direita
	if _pos_x = "right" // desenhar na direita
		_x_display = display_get_gui_width() -(20 *_x_display_distance);
	else if _pos_x = "left" // desenhar na esquerda
		_x_display = 0 +(20 *_x_display_distance)
	else // se o valor estier incorreto desenhe na direita
		_x_display = display_get_gui_width() -(20 *_x_display_distance);
		
	// display no eixo y
	var _y_display = display_get_gui_height();

	// desenhando as informações do jogador
	// só desenho se eu tenho vidasa para desenhar 
	if (_global_p_ui > 0)
	{
		repeat(_global_p_ui) // repetindo o código 
		{
			// desenhando sprites
			draw_sprite_ext(_sprite, 0, _x_display, _y_display -40, 1.5, 1.5, 0, c_white, .7);
			// atualizando distancia conforme se repete
			_x_display_distance += 2;
			
			#region atualizando posição para o proximo desenho
				// verificando se estou na esqueda ou direita
				if _pos_x = "right" // desenhar na direita
					_x_display = display_get_gui_width() -(20 *_x_display_distance);
				else if _pos_x = "left" // desenhar na esquerda
					_x_display = 0 +(20 *_x_display_distance)
				else // se o valor estier incorreto desenhe na direita
					_x_display = display_get_gui_width() -(20 *_x_display_distance);
			#endregion
		}
	}
}