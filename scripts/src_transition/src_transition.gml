#region variaveis
	// room
	global.next_room		= rm_inicio;
	// transição
	global.on_transition	= false;
#endregion

#region scripts funcões
	function switch_room() // função para trocar de roon
	{
		room_goto(global.next_room); // trocar de room
		global.on_transition = true; // transição está ativa
	}
	
	function end_transition() // avisar que não tenho mais transição
	{
		global.on_transition = false;	// avisando que não tenho mais transição
	}
#endregion