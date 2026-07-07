/// @description Check collision

key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);

if(key_up)
{
	global.controller = 0;	
}

if ((gamepad_axis_value(global.ControllerId,gp_axislv) < -0.4 && analogUpPrev == false) || gamepad_button_check_pressed(global.ControllerId,gp_padu))
{
	key_up = 1;
	global.controller = 1;
	analogUpPrev = true;
}

switch(global.healthUpgrades)
{
	case 0:
		itemPrice = 500;
		break;
	case 1:
		itemPrice = 2000;
		break;
	case 2:
		itemPrice = 10000;
		break;
}

if(global.healthUpgrades >= 3)
{
	soldOut = true;	
}

if(place_meeting(x,y,oPlayer))
{
	colliding = true;	
	if(key_up)
	{
		if(global.overallCoins >= itemPrice && !soldOut)
		{
			global.overallCoins -= itemPrice;
			global.healthUpgrades++;
			// Change max health
			global.maxHealth += 2;
			global.health += 2;
			audio_play_sound(snd_UpgradeMaxHealth,5,false);
			Save();
		}
	}
}
else
{
	colliding = false;	
}

// Record analog inputs for this frame
if(gamepad_axis_value(global.ControllerId,gp_axislv) < -0.4)
{
	analogUpPrev = true;	
}
else
{
	analogUpPrev = false;	
}

if(gamepad_axis_value(global.ControllerId,gp_axislv) > 0.4)
{
	analogDownPrev = true;	
}
else
{
	analogDownPrev = false;	
}