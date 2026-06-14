#region chamada de metodos
	enemy02_shot(obj_enemy02_shot, 2, 3);
#endregion

#region controle
	// quando minha vida acabar eu morro
	if (enemy_life <= 0)
		instance_destroy();				// me destruindo normalmente
	
#endregion

#region padrão
	animation_enemy_endgame();	// encerramento
	default_scale();			// resetando efeitos
	default_color();			// resetando cor
#endregion

