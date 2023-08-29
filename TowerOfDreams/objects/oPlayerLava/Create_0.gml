/// @description Start Alarm

audio_play_sound(snd_Lava,5,false);
alarm[0] = room_speed * 2;

switch(global.palette)
{
	case 0:
		sprite_index = sPlayerLava;
		break;
	case 1:
		sprite_index = sPlayerLavaRed;
		break;
	case 2:
		sprite_index = sPlayerLavaGreen;
		break;
}