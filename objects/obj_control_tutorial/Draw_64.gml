// só desenho o tutorial se não estou em transição
if global.on_transition exit;

var _gui_x, _gui_y;
_gui_x	=	display_get_gui_width()/2;
_gui_y	=	display_get_gui_height() *.2;

draw_set_font(fnt_tutorial);	// arrumando fonte
draw_set_halign(fa_center);		// alinhando texto ao centro
draw_set_valign(fa_middle);		// alinhando texto ao meio
draw_set_alpha(text_alpha);

	draw_text(_gui_x, _gui_y, tutorial_text[text_index]); // desenhando a atual menssagem de tutorial;
	
draw_set_font(-1);	// resetanto tudo ao padrão
draw_set_halign(-1);	
draw_set_valign(-1);
draw_set_alpha(1);

show_debug_message(text_alpha);