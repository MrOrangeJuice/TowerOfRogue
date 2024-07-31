/// @description Collisions

if(!global.paused)
{
	image_speed = 1;
	if(place_meeting(x,y-1,oPlayer))
	{
		sprite_index = sTempPlatformStand;
	}
	else
	{
		// Squish in
		leftPlat = instance_place(x-4,y,oTempPlatform);
		rightPlat = instance_place(x+4,y,oTempPlatform);
		if(leftPlat && leftPlat.sprite_index == sTempPlatformStand) sprite_index = sTempPlatformPushLeft;
		else if(rightPlat && rightPlat.sprite_index == sTempPlatformStand) sprite_index = sTempPlatformPushRight;
		else sprite_index = sTempPlatform;
	}
}
else
{
	image_speed = 0;	
}