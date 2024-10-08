/// @description Update


// Set to elite enemies to elite just in case
if(object_index == oBallEnemyElite || object_index == oCannonCloudElite || object_index == oCannonCloudUpElite || object_index == oFirePlantElite || object_index == oFlyingEnemyElite || object_index == oGravityEnemyElite || object_index == oGroundEnemyElite || object_index == oTankEnemyElite || object_index == oTankEnemyStationaryElite || object_index == oWrenchEnemyElite)
{
	elite = true;
}

if(!global.paused)
{
	// Spawn gilded effects
	if(gilded && givesHealth && !invincible)
	{
		randInt = irandom_range(0,19);
		if(randInt < 2)
		{
			instance_create_layer(x+irandom_range(-sprite_width/2,sprite_width/2),y+irandom_range(-sprite_height/2,sprite_height/2),"UI",oGildedVFX);	
		}
	}
}

if(hp <= 0)
{
	if(givesHealth)
	{
		randomize();
		trophy = 0;
		for(i = 0; i < array_length(global.passiveItems); i++)
		{
			if(global.passiveItems[i] == 5)
			{
				trophy++;
			}
		}
		armorTrophy = 0;
		for(i = 0; i < array_length(global.passiveItems); i++)
		{
			if(global.passiveItems[i] == 20)
			{
				armorTrophy++;
			}
		}
		heartChance = irandom_range(1,100);
		armorChance = irandom_range(1,100);
		if(armorChance <= 5 + (armorTrophy * 25) && room != rTutorial && room != rTutorial2)
		{
			armor = instance_create_layer(x-4,y-4,"Collectables",oArmor);	
			armor.vsp = -2;
			armor.canGrab = true;
		}
		else if(heartChance <= 25 + (trophy * 25))
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
			// Overheal gems
			if(global.health == global.maxHealth - 1)
			{
				// Grant 10 gems for a half-overheal
				global.coins += 10;
				if(instance_exists(oPlayer)) instance_create_layer(oPlayer.x,oPlayer.y-8,"Instances",o10);
				audio_play_sound(snd_Overheal,5,false);
			}
			else if(global.health == global.maxHealth)
			{
				// Grant 20 gems for a full-overheal
				global.coins += 20;
				if(instance_exists(oPlayer)) instance_create_layer(oPlayer.x,oPlayer.y-8,"Instances",o20);
				audio_play_sound(snd_Overheal,5,false);
			}
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
		// Spawn bits
		instance_create_layer(x,y,"Pipes",oPlayerBit);
		instance_create_layer(x,y,"Pipes",oPlayerBit);
		instance_create_layer(x,y,"Pipes",oPlayerBit);
		instance_create_layer(x,y,"Pipes",oPlayerBit);
		instance_create_layer(x,y,"Pipes",oPlayerBit);
		instance_create_layer(x,y,"Pipes",oPlayerBit);
		instance_create_layer(x,y,"Pipes",oPlayerBit);
		instance_create_layer(x,y,"Pipes",oPlayerBit);
	}
	else
	{
		instance_create_layer(x,y,"Enemies",oEnemyDeath);
		// Spawn bits
		instance_create_layer(x,y,"Pipes",oEnemyBit);
		instance_create_layer(x,y,"Pipes",oEnemyBit);
		instance_create_layer(x,y,"Pipes",oEnemyBit);
		instance_create_layer(x,y,"Pipes",oEnemyBit);
		// Spawn less for cannon ball type enemies
		if(object_index != oCannonBall && object_index != oCannonBallUp && object_index != oCannonBallDown && object_index != oFireBall && object_index != oMissile && object_index != oWrench)
		{
			instance_create_layer(x,y,"Pipes",oEnemyBit);
			instance_create_layer(x,y,"Pipes",oEnemyBit);
			instance_create_layer(x,y,"Pipes",oEnemyBit);
			instance_create_layer(x,y,"Pipes",oEnemyBit);
		}
	}
	
	// Spawn gilded gems
	if(gilded && givesHealth && !invincible)
	{
		dynamiteInItems = false;
		dynamiteNum = 0;
		for(i = 0; i < array_length(global.passiveItems); i++)
		{
			if(global.passiveItems[i] == 18)
			{
				dynamiteInItems = true;
				dynamiteNum++;
			}
		}
		randomize();
		randX = 0;
		randY = 0;
		for(i = 0; i < (10 + (dynamiteNum * 20)); i++)
		{
			randX = random_range(-1.5,1.5);
			randY = random_range(-1,-3);
			newGem = instance_create_layer(x,y,"Collectables",oGildedGem);
			newGem.hsp = randX;
			newGem.vsp = randY;
		}
	}
	
	// Spawn lime essence gems
	if(global.essence == 2 && givesHealth && !invincible)
	{
		randomize();
		randX = 0;
		randY = 0;
		for(i = 0; i < irandom_range(3,9); i++)
		{
			randX = random_range(-1.5,1.5);
			randY = random_range(-1,-3);
			newGem = instance_create_layer(x,y,"Collectables",oGildedGem);
			newGem.hsp = randX;
			newGem.vsp = randY;
			newGem.instaMagnet = true;
		}	
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