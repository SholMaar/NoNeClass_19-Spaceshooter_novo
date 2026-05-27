// velocidade do tiro
vel_player_shoot = -10;

#region métodos
	player_shoot_control = function()
	{
		// impedindo que o tiro se mantenha na memoria 
		if (y <= -64)
		{
			instance_destroy(); // mes destruindo ao sair da room
		}
	}
#endregion