/// @description Update

event_inherited();

if(!global.paused)
{
	image_speed = 1;
	// Animation and movement
	if(dir == "left")
	{
		sprite_index = sMissileLeft;
		x += missileSpeed * -1;
	}
	else if(dir == "right")
	{
		sprite_index = sMissileRight;
		x += missileSpeed * 1;
	}
	else if(dir == "upright")
	{
		sprite_index = sMissileRightUp;
		x += missileSpeed * 1;
		y += missileSpeed * -1;
	}
	else if(dir == "downright")
	{
		sprite_index = sMissileRightDown;
		x += missileSpeed * 1;
		y += missileSpeed * 1;
	}
	else if(dir == "up")
	{
		sprite_index = sMissileUp;
		y += missileSpeed * -1;
	}
	else if(dir == "down")
	{
		sprite_index = sMissileDown;
		y += missileSpeed * 1;
	}
	else if(dir == "upleft")
	{
		sprite_index = sMissileLeftUp;
		x += missileSpeed * -1;
		y += missileSpeed * -1;
	}
	else if(dir == "downleft")
	{
		sprite_index = sMissileLeftDown;
		x += missileSpeed * -1;
		y += missileSpeed * 1;
	}
}
else
{
	image_speed = 0;
	alarm[0]++;	
	alarm[1]++;
}