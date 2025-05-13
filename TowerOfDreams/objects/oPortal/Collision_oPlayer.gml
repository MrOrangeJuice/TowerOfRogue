/// @description Progress

audio_play_sound(snd_Portal,5,false);
instance_destroy(oPlayer);
instance_create_layer(x+8,y+8,"Instances",oPlayerPortal);
alarm[0] = room_speed * 0.5;

if(global.timeTrial)
{
	global.timeIncrement = false;
	audio_play_sound(snd_Finish,5,false);

	global.sideRoom = rTitle;
	global.shopRoom = rTitle;
	global.sideChestOpened = false;
	global.pipeSpawned = false;
	global.shopSpawned = false;
	global.pipeY = 0;
	global.shopY = 0;
	audio_stop_sound(msc_Floor1);
	audio_stop_sound(msc_Floor1Variant);
	audio_stop_sound(msc_Floor2);
	audio_stop_sound(msc_Floor2Variant);
	audio_stop_sound(msc_Floor3);
	audio_stop_sound(msc_Floor3Variant);
	global.floor1Music = false;
}