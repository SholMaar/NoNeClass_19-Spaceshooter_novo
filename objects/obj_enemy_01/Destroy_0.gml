// criando explosão
creat_particle(obj_enemy_explosion_fx);

// criar drop
drop_chance(100, 50, obj_powerup_01);

// tocando som
var _pitch = 1 *random_range(.8, 1.3);
// verificando se tem algum outro audio do mesmo tipo
audio_play_sound(snd_enemy_down, 2, 0, .5, 0, _pitch);

// tremendo a tela
screenshack(7);