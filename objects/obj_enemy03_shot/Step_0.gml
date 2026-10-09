if global.hitstop exit; // executanfo hitstop


// adaptação gamefeel
velv = lerp(velv, vel, .1);
velh = lerp(velh, vel, .1);

var _velv = lengthdir_y(velv, direction);
y -= _velv;

var _velh = lengthdir_x(velh, direction);
x -= _velh