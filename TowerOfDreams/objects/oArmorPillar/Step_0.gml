/// @description Check collision

key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);

if(key_up)
{
	global.controller = 0;	
}

if ((gamepad_axis_value(0,gp_axislv) < -0.4 && analogUpPrev == false) || gamepad_button_check_pressed(0,gp_padu))
{
	key_up = 1;
	global.controller = 1;
	analogUpPrev = true;
}
if ((gamepad_axis_value(4,gp_axislv) < -0.4 && analogUpPrevD == false) || gamepad_button_check_pressed(4,gp_padu))
{
	key_up = 1;
	global.controller = 2;
	analogUpPrev = true;
}

// Determine if player already has armor
if(global.redUnlocked && paletteNum == 1)
{
	prevBought = true;	
}
if(global.greenUnlocked && paletteNum == 2)
{
	prevBought = true;	
}
if(global.zombieUnlocked && paletteNum == 3)
{
	prevBought = true;	
}
if(global.goldUnlocked && paletteNum == 4)
{
	prevBought = true;	
}

if(place_meeting(x,y,oPlayer))
{
	colliding = true;	
	if(key_up)
	{
		// Buy for first time
		if(!prevBought)
		{
			if(global.overallCoins >= itemPrice)
			{
				global.overallCoins -= itemPrice;
				global.palette = paletteNum;
				ChangePlayerSkin();
				switch(paletteNum)
				{
					case 1:
						global.redUnlocked = true;
						break;
					case 2:
						global.greenUnlocked = true;
						break;
					case 3:
						global.zombieUnlocked = true;
						break;
					case 4:
						global.goldUnlocked = true;
						break;
				}
				audio_play_sound(snd_UpgradeMaxHealth,5,false);
				Save();
				CheckForAchievements();
			}
		}
		// Switch between owned armor
		else
		{
			if(paletteNum == global.palette)
			{
				global.palette = 0;
				ChangePlayerSkin();
				audio_play_sound(snd_UpgradeMaxHealth,5,false);
				Save();
			}
			else
			{
				global.palette = paletteNum;
				ChangePlayerSkin();
				audio_play_sound(snd_UpgradeMaxHealth,5,false);
				Save();
			}
		}
	}
}
else
{
	colliding = false;	
}

// Record analog inputs for this frame
if(gamepad_axis_value(0,gp_axislv) < -0.4)
{
	analogUpPrev = true;	
}
else
{
	analogUpPrev = false;	
}

if(gamepad_axis_value(0,gp_axislv) > 0.4)
{
	analogDownPrev = true;	
}
else
{
	analogDownPrev = false;	
}

if(gamepad_axis_value(4,gp_axislv) < -0.4)
{
	analogUpPrevD = true;	
}
else
{
	analogUpPrevD = false;	
}

if(gamepad_axis_value(4,gp_axislv) > 0.4)
{
	analogDownPrevD = true;	
}
else
{
	analogDownPrevD = false;	
}