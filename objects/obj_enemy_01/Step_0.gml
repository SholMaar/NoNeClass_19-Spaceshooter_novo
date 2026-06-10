// atirar
enemy_01_shooting(obj_shoot_enemy_01);

// me destruindo se cheguei no final da sequencia
if (creat_in_sequence && !in_sequence)
{
	instance_destroy(id, false); 
}

// me destruir
if (enemy_life <= 0)
{
	instance_destroy();
}

// encerramento
animation_enemy_endgame();
// resetando efeitos
default_scale();