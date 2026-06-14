#region variaveis
	// velocidades
		vel_powerup		= 2;
		
	// controle
		grow			= false;
		
#endregion

#region metodos
	// configurações do powerup
	powerup_settings = function()
	{
		#region movimentação
			vspeed = vel_powerup // fazendo ele descer
			
			var _outide_down_room = room_height +sprite_height;
			if (y > _outide_down_room)	// se sair por baixo da room
				instance_destroy(id, false);	// me destruo sem executar o destroy
		#endregion
		
		// fazendo animação
		if (grow){
			image_xscale += .02;
			image_yscale -= .02;
		}					  
		else{				  
			image_xscale -= .02
			image_yscale += .02
		}
		
		if image_xscale > 1.2
			grow = false
		else if image_xscale < .8
			grow = true;
	}
#endregion