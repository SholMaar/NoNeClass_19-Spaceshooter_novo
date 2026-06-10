
// metodo de sair do tutorial
exit_tutorial = function()
{
	var _exit_key = keyboard_check_pressed(vk_escape || vk_delete); 
	
	if _exit_key
	{
		layer_sequence_create("transition", 0, 0, sq_transition);
		global.next_room = rm_inicio;
	}
}
