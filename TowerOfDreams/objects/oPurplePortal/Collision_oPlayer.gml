/// @description Progress

if(global.floor3Completed)
{
	audio_play_sound(snd_Portal,5,false);
	instance_destroy(oPlayer);
	player = instance_create_layer(x+8,y+8,"Instances",oPlayerPortal);
	player.purple = true;
	alarm[0] = room_speed * 0.5;
}