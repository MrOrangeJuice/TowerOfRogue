/// @description Disable pausing

global.canPause = false;

switch(global.palette)
{
	case 0:
		sprite_index = sPlayerPortal;
		break;
	case 1:
		sprite_index = sPlayerPortalRed;
		break;
	case 2:
		sprite_index = sPlayerPortalGreen;
		break;
	case 3:
		sprite_index = sPlayerPortalZombie;
		break;
}