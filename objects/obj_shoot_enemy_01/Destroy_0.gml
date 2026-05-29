// criaando particula ao ser destruido
if object_exists(obj_player_shoot_fx)
	instance_create_layer(x, y, "particles", obj_player_shoot_fx);