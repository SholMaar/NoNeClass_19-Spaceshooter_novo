#region variaveis
	// controle
		machine_index			= 0;
		tutorial_state_machine	= ["next_tutorial", "move", "shoot", "shield", "exit"];
		
		text_index				= 0;
		tutorial_text			= ["press ENTER\nto next step", "press WASD or\narrows to move", 
									"press SPACE\nto shoot", "press E\nto shield", "press SCAPE or\nBACKSPACE to exit"];
		
		text_alpha				= 1;
		switch_text				= false;
#endregion

#region
	// metodo de sair do tutorial
	exit_tutorial	= function()
	{
		var _exit_key = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace); 
	
		if _exit_key && !global.on_transition
		{
			layer_sequence_create("transition", 0, 0, sq_transition);
			global.next_room		= rm_inicio;	// indo para o inicio da room
			global.on_transition	= true;			// avisando que já estou em transição
		}
	}
	
	// função para trocar de texto
	switch_text_key = function()
	{
		text_index	= machine_index;
		// criando condição de saida
		var _next_tutorial	= keyboard_check_pressed(vk_enter);
				
		if	(_next_tutorial)
			switch_text = true; // avisando que devo trocar de texto
	}
	
	// instruções de como jogar 
	tutorial		= function()
	{
		// maquina de estados
		switch tutorial_state_machine[machine_index]
		{
			case "next_tutorial":
			{	
				switch_text_key();
			}break;
			
			case "move":
			{	
				switch_text_key();
			}break;
			
			case "shoot":
			{
				switch_text_key();
			}break;
			
			case "shield":
			{
				switch_text_key();
			}break;
			
			case "exit":
			{
				switch_text_key();
			}break;
			
		}
		
		// mudando de texto do tutorial
		if (switch_text)
		{
			text_alpha = lerp(text_alpha, 0, .1);	// diminuindo a transparencia do meu texto
			if (text_alpha < .1)					// quando chegar no fim da minha transição
			{
				switch_text		= false;			// digo que não estou mais mudando de texto
				machine_index	++;					// subo 1 no index do state machine
				
				// garantindo que eu nunca vou sair do limite do array
				var _array_limit = array_length(tutorial_state_machine) -1;
				if (machine_index > _array_limit)
					machine_index = 0;				// volto do zero
			}
		}else
			text_alpha = lerp(text_alpha, 1, .1);	// aumentando a transparencia do meu texto
	}
#endregion