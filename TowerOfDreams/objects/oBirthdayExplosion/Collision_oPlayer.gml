/// @description Send player up

if(!array_contains(enemies,other))
{
	array_push(enemies,other);
	with (other)
	{
		if(global.essence == 4)
		{
			vsp = -5;
		}
		else
		{
			vsp = -4.5;
		}
		extraJump = false;
		audio_play_sound(snd_BombJump,5,false);
	}
}