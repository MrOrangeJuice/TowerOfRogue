/// @description Update

if(hp <= 0)
{
	if(givesHealth)
	{
		randomize();
		if(irandom_range(1,4) == 2)
		{

			heart = instance_create_layer(x-4,y-4,"Collectables",oHeart);	
			heart.vsp = -2;
			heart.canGrab = true;
		}
	}
	// Check for death items
	goblet = false;
	gobletNum = 0;
	for(i = 0; i < array_length(global.passiveItems); i++)
	{
		if(global.passiveItems[i] == 2)
		{
			goblet = true;
			gobletNum++;
		}
	}
	if(goblet && givesHealth)
	{
		instance_create_layer(x,y-16,"Instances",global.gobletVFX[global.gobletCombo]);
		global.gobletCombo++;
		if(global.gobletCombo >= 6)
		{
			if(global.health < global.maxHealth)
			{
				global.health += 2 * gobletNum;
			}
			if(global.health > global.maxHealth)
			{
				global.health = global.maxHealth;	
			}
			audio_play_sound(snd_Heal,5,false);
			with (oGame) healthTextScale = 1.15;
			global.gobletCombo = 0;
		}
	}
	if (elite)
	{
		instance_create_layer(x,y,"Enemies",oEnemyEliteDeath);
	}
	else
	{
		instance_create_layer(x,y,"Enemies",oEnemyDeath);
	}
	
	
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