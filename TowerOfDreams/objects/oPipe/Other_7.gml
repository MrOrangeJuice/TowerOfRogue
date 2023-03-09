/// @description Transition to next room

image_speed = 0;

switch(global.pipeCount)
{
	// Jump in pipe
	case 0:
		global.originalRoom = room;
		image_speed = 0;
		PickSideArea();
		global.pipeCount++;
		break;
	// spit out player
	case 1:
		image_speed = 0;
		playerJustSpawned = true;
		alarm[0] = room_speed * 0.5;
		audio_play_sound(snd_Bumper,5,false);
		player = instance_create_layer(x+(32*image_xscale),y,"Instances",oPlayer);
		player.currentwalksp = 3 * image_xscale;
		player.vsp = -2;
		global.pipeCount++;
		break;
	// go back to original room
	case 2:
		image_speed = 0;
		SlideTransition(TRANS_MODE.GOTO,global.originalRoom);
		global.pipeCount++;
		break;
	// Spit player back out
	case 3:
		image_speed = 0;
		playerJustSpawned = true;
		alarm[0] = room_speed * 0.5;
		audio_play_sound(snd_Bumper,5,false);
		player = instance_create_layer(x+(32*image_xscale),y,"Instances",oPlayer);
		player.currentwalksp = 3 * image_xscale;
		player.vsp = -2;
		global.pipeCount = 0;
		image_xscale = 1;
		break;
		break;
}