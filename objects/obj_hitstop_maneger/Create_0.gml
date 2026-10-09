time_hitstop = game_get_speed(gamespeed_fps)/2; // meio segundo

// hitstop background 
backgrounds_layer = get_background();
bg_hspeed = [];
bg_vspeed = [];

hitstop = function()
{
	if (!global.hitstop) return; // se o hitstop não está ativo eu saio da função
	
	// fazendo hitstop
	time_hitstop--; // correndo tempo do hitstop
	
	// mexendo em todas as instancias
	with(all)
	{
		image_speed = 0; // travando animação
	}
	
	// velocidade do background
	hitstop_bg(backgrounds_layer, bg_hspeed, bg_vspeed);

	if time_hitstop <= 0 // quando o tempo acabar
	{
		global.hitstop = false; // desativando hitstop 
		time_hitstop = game_get_speed(gamespeed_fps)/2; // meio segundo
		
		with(all) // mexendo em todos
		{
			image_speed = 1; // retomando animação 
		}
		
		// velocidade do background
		hitstop_bg(backgrounds_layer, bg_hspeed, bg_vspeed);
	}
}