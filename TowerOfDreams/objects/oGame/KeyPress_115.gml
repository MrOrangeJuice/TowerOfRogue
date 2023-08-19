/// @description Coin cheat
if(room == rHub || room == rHubShop)
{
	global.overallCoins += 500;
	audio_play_sound(snd_SwordGet,5,false);	
}
else if(room != rTitle)
{
	global.coins += 50;
	global.coinsThisRun += 50;
	audio_play_sound(snd_SwordGet,5,false);
}