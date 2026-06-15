// fim de jogo
if !instance_exists(obj_player)
	alarm_endgame --;
	
if alarm_endgame <= 0 && !global.on_transition
{
	layer_sequence_create("transition", 0, 0, sq_transition);
	global.next_room = rm_inicio;
	global.on_transition = true;
}