// atirar
enemy01_shot(obj_enemy01_shot);

// me destruir
// quando minha vida acabar eu morro
if (enemy_life <= 0)
	instance_destroy();				// me destruindo normalmente
else if (creat_in_sequence && !in_sequence)
	instance_destroy(id, false); 
	
#region padrão
	animation_enemy_endgame();	// encerramento
	default_scale();			// resetando efeitos
	default_color();			// resetando cor
#endregion