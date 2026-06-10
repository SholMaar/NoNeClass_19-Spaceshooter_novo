// controle
array_menu			= ["Jogar", "Tutorial", "Sair"];
array_menu_indice	= 0;
marge				= 40;

// metodo para desnenhar menu
draw_menu = function()
{
	// pegando metade do meu display GUI
	var _gui_y		= display_get_gui_height();

	draw_set_valign(fa_center);
	draw_set_font(fnt_01);
	var _alt		= string_height("I"); 
		// usando laço de repitação
		for (var i = 0; i <array_length(array_menu); i++)
		{
			// cor default
			var _color	= c_white;
			// margem de texto
			var _marge	= 0;
			
			// aplicando cor ideal ao indice selecionado
			if (array_menu_indice == i)
			{
				_color = c_yellow;
				_marge	= marge
			}
			// colocando cor diferente na seleção atual
			draw_set_colour(_color);
			// desenhando o texto
			draw_text(20 +_marge, _gui_y/2 + (_alt*i), array_menu[i]);
			// resetando cor
			draw_set_colour(-1);
			// arrumando cor de seleção
		}
	draw_set_halign(-1);
	draw_set_font(-1);
}

// metodo de navegar pelo menu
control_menu = function()
{
	// inputs
	var _up, _down;
	_up		= keyboard_check_pressed(vk_up);
	_down	= keyboard_check_pressed(vk_down);
	
	var _array_limit = array_length(array_menu)-1;
	// funcionalidade
	if _down && array_menu_indice == _array_limit
	{
		array_menu_indice = 0;
		marge = 0;
	}
	else if _down // descer
	{
		array_menu_indice++;
		marge = 0;
	}
	
	if _up && array_menu_indice == 0
	{
		array_menu_indice = _array_limit;
		marge = 0;
	}
	else if _up // subir
	{
		array_menu_indice--;
		marge = 0;
	}
	
	// funcionalidade dos botões
	var _select = keyboard_check_pressed(vk_enter);
	if (_select)
	{
		// vericando qual botão está selecionado
		switch array_menu_indice
		{
			case 0:	// Jogar
			{
				// iniciando transição
				layer_sequence_create("transition", 0, 0, sq_transition);
				// definindo destino
				global.next_room = rm_gameplay;
				global.on_transition = true;
			} break;
			case 1:	// Tutorial
			{
				// iniciando transição
				layer_sequence_create("transition", 0, 0, sq_transition);
				// definindo destino
				global.next_room = rm_tutorial;
				global.on_transition = true;
			} break;
			case 2:	// Sair
			{
				game_end();
			} break;
		}
	}
	
	// impedindo de ultrapassar meu limite do array
	array_menu_indice = clamp(array_menu_indice, 0, _array_limit);
	// fazendo animação da margem
	marge = round(lerp(marge, 40, .1));
	
}