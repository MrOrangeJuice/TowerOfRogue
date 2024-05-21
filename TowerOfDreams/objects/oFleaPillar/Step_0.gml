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

switch(global.itemUpgrades)
{
	case 0:
		itemPrice = 500;
		break;
	case 1:
		itemPrice = 750;
		break;
	case 2:
		itemPrice = 1250;
		break;
	case 3:
		itemPrice = 2000;
		break;
	case 4:
		itemPrice = 3000;
		break;
	case 5:
		itemPrice = 4250;
		break;
	case 6:
		itemPrice = 5750;
		break;
	case 7:
		itemPrice = 7500;
		break;
}

if(global.itemUpgrades >= 8)
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
			global.itemUpgrades++;
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