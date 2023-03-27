/// @description Move and check collision

// Flip wave
image_xscale = -dir;

if!(global.paused && !global.hitStop)
{
	x += (dir * hsp);

	// Horizontal Collision
	if (place_meeting(x+(hsp*dir),y,oWall))
	{
		vfx = instance_create_layer(x,y,"Instances",oShockwaveVFX);
		if(dir == 1) vfx.image_xscale = -1;
		instance_destroy();
	}
}
else
{
	alarm[0]++;	
}