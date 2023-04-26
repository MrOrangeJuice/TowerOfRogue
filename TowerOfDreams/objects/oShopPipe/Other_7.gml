/// @description Transition to next room

image_speed = 0;

switch(global.shopPipeCount)
{
	// Jump in pipe
	case 0:
		global.originalRoom = room;
		image_speed = 0;
		// Make sure not to repick side room
		if(global.shopRoom == rTitle)
		{
			PickShopArea();
		}
		else
		{
			SlideTransition(TRANS_MODE.GOTO,global.shopRoom);
		}
		global.shopPipeCount++;
		break;
	// spit out player
	case 1:
		global.shopRoom = room;
		image_speed = 0;
		playerJustSpawned = true;
		alarm[0] = room_speed * 0.5;
		audio_play_sound(snd_Bumper,5,false);
		player = instance_create_layer(x-(32*image_xscale),y,"Instances",oPlayer);
		player.currentwalksp = -3 * image_xscale;
		player.vsp = -2;
		global.shopPipeCount++;
		break;
	// go back to original room
	case 2:
		image_speed = 0;
		SlideTransition(TRANS_MODE.GOTO,global.originalRoom);
		global.shopPipeCount++;
		break;
	// Spit player back out
	case 3:
		image_speed = 0;
		playerJustSpawned = true;
		alarm[0] = room_speed * 0.5;
		audio_play_sound(snd_Bumper,5,false);
		player = instance_create_layer(x-(32*image_xscale),y,"Instances",oPlayer);
		player.currentwalksp = -3 * image_xscale;
		player.vsp = -2;
		global.shopPipeCount = 0;
		image_xscale = 1;
		break;
		break;
}