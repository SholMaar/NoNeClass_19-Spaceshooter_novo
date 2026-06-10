// só desenho se não tenho transição
if (global.on_transition) exit;

// desenhando GUI no meu display
draw_gui_player(); // desenhando escudos
draw_gui_player(spr_gui_player_life, global.player_current_life_gui, 1, 0, "left"); // desenhando vida
