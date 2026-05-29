#region variaveis
	// velocidades
	vel_shoot_enemy_01 = 5;
#endregion

// aplicando velocidade vertical
vspeed = vel_shoot_enemy_01;

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