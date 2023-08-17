/// @description Coin cheat
if(room == rHub)
{
	global.overallCoins += 50;
	audio_play_sound(snd_SwordGet,5,false);	
}
else if(room != rTitle)
{
	global.coins += 50;
	audio_play_sound(snd_SwordGet,5,false);
}