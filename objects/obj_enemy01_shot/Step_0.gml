enemy01_shot_control();

	
if (load)
{
	image_xscale = lerp(image_xscale, 3, .05);
	image_yscale = image_xscale;
	
	if (image_xscale >= 2.9)
	{
		vel_shot_enemy = 15;
		vspeed = vel_shot_enemy; // dando uma super velocidade
	}else
		vspeed = 0
}