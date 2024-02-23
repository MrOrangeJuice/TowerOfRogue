/// @description Update

if(hp <= 0)
{
	// Spawn item
	newItem = instance_create_layer(x,y-4,"Collectables",global.itemObjects[item]);
	newItem.vsp = -3;
	
	// Spawn bits
	instance_create_layer(x+4,y+4,"Pipes",oPlayerBit);
	instance_create_layer(x+4,y+4,"Pipes",oPlayerBit);
	instance_create_layer(x+4,y+4,"Pipes",oPlayerBit);
	instance_create_layer(x+4,y+4,"Pipes",oPlayerBit);
	
	// Spawn explosion
	audio_play_sound(snd_EnemyDeath,5,false);
	instance_create_layer(x+4,y+4,"Enemies",oEnemyEliteDeath);
	
	DeleteGraveData();
	
	// Update spot in array
	listSize = ds_list_size(global.enemyArray);
	for(i = 0; i < listSize; i++)
	{
		// Get array of [id,collected] from list of enemies
		enemyData = array_create(2);
		enemyData = global.enemyArray[| i];
		if(enemyData[0] == id && enemyData[1] == true)
		{
			// Update back in list
			global.enemyArray[| i] = [enemyData[0],false];	
		}
	}

	instance_destroy();	
}
else if(hp <= 1)
{
	if(bitSpawns > 1)
	{
		// Spawn bits
		instance_create_layer(x+4,y+4,"Pipes",oPlayerBit);
		instance_create_layer(x+4,y+4,"Pipes",oPlayerBit);
		instance_create_layer(x+4,y+4,"Pipes",oPlayerBit);
		instance_create_layer(x+4,y+4,"Pipes",oPlayerBit);
		bitSpawns--;
	}
}

// Fall
vsp += grv;
// Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

// Animation
if(hp > 1)
{
	sprite_index = sGrave;	
}
else
{
	sprite_index = sGraveBroken;	
}