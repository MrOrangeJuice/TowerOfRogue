/// @description Get Item

if(other.canGrab)
{
	with(oGame) itemTextScale = 1.3;
	
	// Reset walksp in case of boots
	walksp = 1;
	running = false;

	// If you already have an item, drop it on the ground
	if(global.item != -1)
	{
		oldItem = instance_create_layer(x-4,y-8,"Collectables",global.itemObjects[global.item]);
		oldItem.vsp = -3;
	}

	global.item = other.itemId;
	instance_destroy(other);
	instance_create_layer(other.x,other.y,"CoinVFX",oItemVFX);
	audio_play_sound(snd_Item,5,false);
}