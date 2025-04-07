/// @description Progress

audio_play_sound(snd_Portal,5,false);
instance_destroy(oPlayer);
player = instance_create_layer(x+6,y+6,"Instances",oPlayerPortal);
player.specificLevel = specificLevel;
alarm[0] = room_speed * 0.5;