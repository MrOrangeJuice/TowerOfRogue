/// @description Despawn

vfx = instance_create_layer(x,y,"Instances",oShockwaveVFX);
if(dir == 1) vfx.image_xscale = -1;
instance_destroy();