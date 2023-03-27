/// @description Move and check collision

if!(global.paused && !global.hitStop)
{
	x += (dir * hsp);

	// Horizontal Collision
	if (place_meeting(x+(hsp*dir),y,oWall))
	{
		instance_create_layer(x,y,"VFX",oShockwaveVFX);
		instance_destroy();
	}

	// Vertical Collision
	// If no ground below you destroy
	if (!place_meeting(x+(16*dir),y+1,oWall))
	{
		instance_create_layer(x,y,"VFX",oShockwaveVFX);
		instance_destroy();
	}
}
else
{
	alarm[0]++;	
}