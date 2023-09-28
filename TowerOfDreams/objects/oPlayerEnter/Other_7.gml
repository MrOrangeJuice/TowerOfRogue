/// @description Spawn player

// Setup state of coins and enemies
if(global.inARun)
{
	for(i = 0; i < instance_number(oGem); i++)
	{
		newArray = [instance_find(oGem,i),true];
		ds_list_add(global.coinArray,newArray);
	}
	
	for(i = 0; i < instance_number(oEnemy); i++)
	{
		newArray = [instance_find(oEnemy,i),true];
		ds_list_add(global.enemyArray,newArray);
	}
	
	for(i = 0; i < instance_number(oSlimeBlock); i++)
	{
		newArray = [instance_find(oSlimeBlock,i),true];
		ds_list_add(global.slimeArray,newArray);
	}
}

// Check for items
randomize();
shield = 0;
for(i = 0; i < array_length(global.passiveItems); i++)
{
	if(global.passiveItems[i] == 11)
	{
		shield++;
	}
}

// Give armor
if(shield > 0)
{
	global.armor += shield;
	audio_play_sound(snd_Armor,5,false);
	with (oGame) armorTextScale = 1.15;
}

global.canPause = true;
player = instance_create_layer(x,y,"Instances",oPlayer);
instance_destroy();