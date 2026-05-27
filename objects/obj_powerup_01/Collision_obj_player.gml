// verificando se a instancia que colidiu existe 
var _exist_player = instance_exists(other);
if _exist_player
	other.player_levelup(); // aumentando level do jogador

// me destruindo ao colidir com o jogador
instance_destroy();