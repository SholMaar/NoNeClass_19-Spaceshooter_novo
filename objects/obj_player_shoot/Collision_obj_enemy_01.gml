// checagem exclusiva para inimigo
if (instance_exists(obj_enemy_01))
{
	other.enemy_life--; // diminuindo vida do inimigo
	other.time_blink_effect();
}

instance_destroy(); // me destruindo

// tremendo tela 
screenshack(5);