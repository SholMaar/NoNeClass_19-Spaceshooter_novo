// checagem exclusiva para inimigo
if (instance_exists(obj_enemy01))
{
	other.enemy_life -= .2;			// diminuindo vida do inimigo
	other.time_blink_effect();	// aplicando efeito de piscar
}

instance_destroy(); // me destruindo

// tremendo tela 
screenshack(5);