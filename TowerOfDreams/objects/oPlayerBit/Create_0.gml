/// @description Init

// Set Random Direction
direction = random_range(0, 360);
speed = 1;

// Set gravity variables
vsp = -3;
grv = 0.15;

// Set despawn timer
alarm[0] = room_speed * 2;

switch(global.palette)
{
	case 0:
		sprite_index = sPlayerBit;
		break;
	case 1:
		sprite_index = sPlayerBitRed;
		break;
	case 2:
		sprite_index = sPlayerBitGreen;
		break;
	case 3:
		sprite_index = sPlayerBitZombie;
		break;
}