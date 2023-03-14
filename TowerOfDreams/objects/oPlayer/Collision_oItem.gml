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
	
	// Create item pop up
	// Destroy any old ones
	instance_destroy(oItemPopup);
	popup = instance_create_layer(x,y,"UI",oItemPopup);
	popup.name = other.itemName;
	popup.desc = other.itemDesc;
	
	// Spawn tutorial
	if(instance_exists(oItemTutorialFadeIn)) oItemTutorialFadeIn.image_speed = 1;
}