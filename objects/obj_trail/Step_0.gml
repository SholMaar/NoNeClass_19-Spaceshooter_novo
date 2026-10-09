if global.hitstop exit

image_alpha -= 0.08;

image_yscale -= 0.05;
image_xscale = image_xscale;

image_xscale = clamp(image_xscale, 0, 10);
image_yscale = clamp(image_yscale, 0, 10);

if image_alpha <= 0 instance_destroy();
