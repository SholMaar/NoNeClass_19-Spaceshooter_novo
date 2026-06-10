#region variaveis
	// velocidades
	start_vel_shot(5);
	
	// controle
	load = false;
#endregion

if !load
{
	// aplicando velocidade vertical
	speed_shot(20, .4);
}else
{
	vspeed = 0;
}

#region metodos
	// controle do tiro
	enemy_01_shooting_control = function()
	{
		// evitando que o tiro continue existindo após sair da room
		var _outside_vroom = room_height + sprite_height/2;
		if (y > _outside_vroom)
			instance_destroy(id, false); // não execute nada no evento de destruição
	}
#endregion