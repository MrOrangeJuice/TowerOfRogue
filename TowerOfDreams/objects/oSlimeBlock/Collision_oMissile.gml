/// @description Destroy

instance_create_layer(x,y,"VFX",oSlimeBlockDestroyVFX);
audio_play_sound(snd_SlimeExplosion,5,false);
audio_play_sound(snd_SlimeScream,5,false);

// Update spot in array
listSize = ds_list_size(global.slimeArray);
for(i = 0; i < listSize; i++)
{
	// Get array of [id,collected] from list of enemies
	slimeData = array_create(2);
	slimeData = global.slimeArray[| i];
	if(slimeData[0] == id && slimeData[1] == true)
	{
		// Update back in list
		global.slimeArray[| i] = [slimeData[0],false];	
	}
}

instance_destroy();