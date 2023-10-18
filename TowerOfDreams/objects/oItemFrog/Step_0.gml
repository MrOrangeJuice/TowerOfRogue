/// @description Check for item falling

if(!global.paused)
{
	image_speed = 1;
	// Look for item
	if(place_meeting(x,y-128,oItem) && !tongue)
	{
		tongue = true;
		sprite_index = sItemFrogTongue;
		alarm[0] = room_speed * 0.3;
		alarm[1] = room_speed * 1.2;
		alarm[2] = room_speed * 2.35;
		alarm[3] = room_speed * 2.15;
	}
}
else
{
	alarm[0]++;
	alarm[1]++;
	alarm[2]++;
	alarm[3]++;
	image_speed = 0;	
}