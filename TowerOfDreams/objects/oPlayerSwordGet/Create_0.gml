/// @description Init

audio_play_sound(snd_SwordGet,5,false);

switch(global.palette)
{
	case 0:
		sprite_index = sPlayerSwordGet;
		break;
	case 1:
		sprite_index = sPlayerSwordGetRed;
		break;
	case 2:
		sprite_index = sPlayerSwordGetGreen;
		break;
	case 3:
		sprite_index = sPlayerSwordGetZombie;
		break;
}