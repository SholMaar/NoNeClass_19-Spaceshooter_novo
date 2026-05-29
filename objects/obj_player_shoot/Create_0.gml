// velocidade do tiro
vel_player_shoot = -10;

#region métodos
	player_shoot_control = function()
	{
		// impedindo que o tiro se mantenha na memoria 
		var _outside_vroom = 0 -sprite_height/2
		if (y <= _outside_vroom)
		{
			instance_destroy(id, false); // mes destruindo ao sair da room
		}
	}
#endregion