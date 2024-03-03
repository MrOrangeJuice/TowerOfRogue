/// @description Get Item

if(other.canGrab)
{
	// Active item
	if(!other.passive)
	{
		with(oGame) itemTextScale = 1.3;
		// Reset walksp in case of boots or lightning
		walksp = 1;
		running = false;
		dashing = false;
		// Reset extra jump variable for wings
		extraJump = true;
		// Reset armed variable for cake
		global.armed = false;

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
		// Remove dialogue for frog
		if(instance_exists(oItemFrog)) oItemFrog.playerHasNoItem = false;
	}
	// Passive item
	else
	{
		with(oGame) passiveItemTextScale = 1.3;
		array_push(global.passiveItems,other.itemPassiveId);
		// Create item pop up
		// Destroy any old ones
		instance_destroy(oItemPopup);
		popup = instance_create_layer(x,y,"UI",oItemPopup);
		popup.name = other.itemName;
		popup.desc = other.itemDesc;
		popup.passive = true;
		popup.passiveID = other.itemPassiveId;
		
		instance_destroy(other);
		instance_create_layer(other.x,other.y,"CoinVFX",oItemVFX);
		audio_play_sound(snd_Item,5,false);
	}
}