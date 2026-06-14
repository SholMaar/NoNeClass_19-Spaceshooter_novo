#region metodos
	destroy_shot_fx = function()
	{
		// me destruindo apoós chegar no fim da minha animação
		if (image_index >= image_number)
		{
			instance_destroy();
		}
	}
#endregion