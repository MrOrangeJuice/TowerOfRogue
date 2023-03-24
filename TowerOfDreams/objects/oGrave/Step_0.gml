/// @description Update

vsp += grv;
// Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
	if(!endSpawned)
	{
		endSpawned = true;
		audio_play_sound(snd_Grave,5,false);
		alarm[0] = room_speed * 2;
	}
}
	
y = y + vsp;