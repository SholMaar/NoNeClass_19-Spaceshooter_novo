// metodo para verificar se cheguei no fim da minha animação
end_animation = function()
{
	if (image_index >= image_number-1)
	{
		instance_destroy();
	}
}