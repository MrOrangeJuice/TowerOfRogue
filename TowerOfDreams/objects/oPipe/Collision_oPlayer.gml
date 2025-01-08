/// @description Start Transition

if(!playerJustSpawned && !global.paused)
{
	// Jump in
	if(global.pipeCount == 0)
	{
		image_speed = 1;
		audio_play_sound(snd_Bumper,5,false);
		instance_destroy(other);
		global.canPause = false;
	}
	
	// Go back
	if(global.pipeCount == 2)
	{
		image_xscale = -1;
		image_speed = 1;
		audio_play_sound(snd_Bumper,5,false);
		instance_destroy(other);
		global.canPause = false;
		
	}
}