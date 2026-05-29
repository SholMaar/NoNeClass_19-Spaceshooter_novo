// criando animação de destruição
if (object_exists(obj_player_shoot_fx)) // só faço isso se o objeto existir
{
	var _shoot_fx = instance_create_layer(x, y, layer, obj_player_shoot_fx); // guardando a particula em uma variavel
	_shoot_fx.image_angle = random(359); // randomizando angulo da partida
}