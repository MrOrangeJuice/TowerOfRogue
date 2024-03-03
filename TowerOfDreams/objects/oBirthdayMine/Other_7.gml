/// @description Change to armed

if(sprite_index == sBirthdaySquish)
{
	sprite_index = sBirthdayArmed;
	audio_play_sound(snd_ActivateCake,5,false);
	global.armed = true;
}