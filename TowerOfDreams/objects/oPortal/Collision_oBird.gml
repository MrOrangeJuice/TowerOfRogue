/// @description Progress

audio_play_sound(snd_Portal,5,false);
instance_create_layer(x+8,y+8,"Instances",oPlayerPortal);
instance_create_layer(other.x,other.y,"Instances",oBirdFlyAway);
instance_destroy(oBird);
alarm[0] = room_speed * 0.5;