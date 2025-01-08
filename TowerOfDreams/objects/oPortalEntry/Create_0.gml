/// @description Init

// If player is coming from side area, don't spawn them
if (global.pipeCount == 3 || global.shopPipeCount == 3) 
{
	instance_destroy();
}
else
{
	audio_play_sound(snd_Portal,5,false);
	alarm[0] = room_speed * 0.25;
	audio_stop_sound(msc_Hub);
	audio_stop_sound(msc_HubShop);
	audio_stop_sound(msc_Lester);
	global.hubMusic = false;
	global.hubShopMusic = false;
	global.hubTestMusic = false;
}