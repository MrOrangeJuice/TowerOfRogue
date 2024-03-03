/// @description Send player up

if(!array_contains(enemies,other))
{
	array_push(enemies,other);
	with (other)
	{
		vsp = -4.5;
		extraJump = false;
		audio_play_sound(snd_BombJump,5,false);
	}
}