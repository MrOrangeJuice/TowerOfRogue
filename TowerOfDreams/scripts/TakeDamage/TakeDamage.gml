// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// damage, horizontal knockback, vertical knockback, hitStun
function TakeDamage(argument0,argument1,argument2,argument3)
{
	if(instance_exists(oPlayer))
	{
		with (oPlayer)
		{
			global.localDamage++;
			audio_play_sound(snd_Damage,5,false);
			if (!global.infiniteHealth && room != rHub) 
			{
				if(global.armor > 0)
				{
					global.armor -= argument0 * (global.hardMode + 1);
					if(global.armor == -1)
					{
						global.health -= 1;
						global.armor = 0;
					}
					audio_play_sound(snd_ArmorBreak,5,false);
				}
				else
				{
					global.health -= argument0 * (global.hardMode + 1);
				}
			}
			// Kill player
			if(global.health <= 0)
			{
				vsp = -argument1;
				// Set hsp to the opposite of your current direction
				currentwalksp = -sign(image_xscale) * argument2;
				hit = true;
				ScreenShake(2,10);
				audio_stop_sound(msc_Floor1);
				audio_stop_sound(msc_Floor1Variant);
				audio_stop_sound(msc_Floor2);
				audio_stop_sound(msc_Floor2Variant);
				audio_stop_sound(msc_Floor3);
				audio_stop_sound(msc_Floor3Variant);
				hitStop = instance_create_layer(0,0,"Instances",oHitstopLong);
				hitStop.death = true;
			}
			// Don't kill player
			else
			{
				vsp = -argument1;
				ghostNum = 0;
				// Check invulernability items
				for(i = 0; i < array_length(global.passiveItems); i++)
				{
					if(global.passiveItems[i] == 14)
					{
						ghostNum++;
					}
				}
				// Set hsp to the opposite of your current direction
				if (argument3) currentwalksp = -sign(image_xscale) * argument2;
				if (argument3) 
				{
					invulnerable = 100 + (ghostNum * 50);
				}
				else
				{
					invulnerable = 50 + (ghostNum * 50);
				}
				if(argument3) hit = true;
				if(argument3) canJump = true;
				ScreenShake(2,10);
				if(argument3) hitStop = instance_create_layer(0,0,"Instances",oHitstop);
			}
		}
		with (oGame) healthTextScale = 1.15;
		with (oGame) armorTextScale = 1.15;
	}
	
	// Bird version
	if(instance_exists(oBird))
	{
		with (oBird)
		{
			global.localDamage++;
			audio_play_sound(snd_Damage,5,false);
			if (!global.infiniteHealth && room != rHub) 
			{
				if(global.armor > 0)
				{
					global.armor -= argument0 * (global.hardMode + 1);
					if(global.armor == -1)
					{
						global.health -= 1;
						global.armor = 0;
					}
					audio_play_sound(snd_ArmorBreak,5,false);
				}
				else
				{
					global.health -= argument0 * (global.hardMode + 1);
				}
			}
			// Kill player
			if(global.health <= 0)
			{
				vsp = -argument1;
				// Set hsp to the opposite of your current direction
				currentwalksp = -sign(image_xscale) * argument2;
				hit = true;
				ScreenShake(2,10);
				audio_stop_sound(msc_Floor1);
				audio_stop_sound(msc_Floor1Variant);
				audio_stop_sound(msc_Floor2);
				audio_stop_sound(msc_Floor2Variant);
				audio_stop_sound(msc_Floor3);
				audio_stop_sound(msc_Floor3Variant);
				hitStop = instance_create_layer(0,0,"Instances",oHitstopLong);
				hitStop.death = true;
			}
			// Don't kill player
			else
			{
				vsp = -argument1;
				ghostNum = 0;
				// Check invulernability items
				for(i = 0; i < array_length(global.passiveItems); i++)
				{
					if(global.passiveItems[i] == 14)
					{
						ghostNum++;
					}
				}
				// Set hsp to the opposite of your current direction
				if (argument3) currentwalksp = -sign(image_xscale) * argument2;
				if (argument3) 
				{
					invulnerable = 100 + (ghostNum * 50);
				}
				else
				{
					invulnerable = 50 + (ghostNum * 50);
				}
				//if(argument3) hit = true;
				//if(argument3) canJump = true;
				ScreenShake(2,10);
				if(argument3) hitStop = instance_create_layer(0,0,"Instances",oHitstop);
			}
		}
		with (oGame) healthTextScale = 1.15;
		with (oGame) armorTextScale = 1.15;
	}
}