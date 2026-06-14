// velocidade do tiro
start_vel_shot(0);

// iniciando minha escala com o dobro de tamanho
image_xscale = 2.5;
image_yscale = 2.5;

#region métodos
	player_shot_control = function()
	{
		// impedindo que o tiro se mantenha na memoria 
		var _outside_vroom = 0 -sprite_height/2
		if (y <= _outside_vroom)
		{
			instance_destroy(id, false); // mes destruindo ao sair da room
		}
	}
#endregion