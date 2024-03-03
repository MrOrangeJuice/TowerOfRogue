/// @description Move

if(!global.paused)
{
	vsp += grv;
	
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
		instance_create_layer(x,y+1.5,"Instances",oBirthdayMine);
		audio_play_sound(snd_Cake,5,false);
		instance_destroy();
	}
	
	y += vsp;
	image_speed = 1;
}
else
{
	image_speed = 0;	
}