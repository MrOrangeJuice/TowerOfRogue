/// @description Update
if(!global.paused)
{
	image_speed = 1;
	if(bought)
	{
		audio_play_sound(snd_Purchase,5,false);
		sprite_index = sStamperBuy;
		bought = false;
	}
}
else
{
	image_speed = 0;
}