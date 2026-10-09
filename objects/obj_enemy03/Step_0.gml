if global.hitstop exit; // executanfo hitstop

#region chamada de metodos
	// iniciando maquina de estados
	state_machine_enemy03();
#endregion

#region controle
	// se minhas vidas acabarem eu morro
	if (enemy_life <= 0)
		instance_destroy();

#endregion
	
#region padrão
	default_color();
	default_scale();
	animation_enemy_endgame();
#endregion


if (x > room_width +sprite_width/2 || x < 0 -sprite_width/2)
{	
	instance_destroy(id, false);
}