/// @description Die

if(place_meeting(x,y,oLava))
{
	if(global.essence != 1)
	{
		global.lavaId = other;
		lavaPlayer = instance_create_layer(x,y,"Instances",oPlayerLava);
		lavaPlayer.image_xscale = image_xscale;
		instance_destroy();
	}
	// Bounce off lava with red armor essence
	else
	{
		vsp = -3;
		lavaBoost = true;
		for(i = 0; i < 10; i++)
		{
			instance_create_layer(x+irandom_range(-8,8),y+8,"UI",oLavaBit);	
		}
		audio_play_sound(snd_Singe,5,false);
	}
}