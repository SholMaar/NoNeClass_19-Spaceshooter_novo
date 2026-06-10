player_shoot_control(); // controles do tiro

// animação
image_xscale = lerp(image_xscale, 1, .2);
image_yscale = lerp(image_yscale, 1, .2);
vel_player_shoot = lerp(vel_player_shoot, -10, .3);
vspeed = vel_player_shoot;