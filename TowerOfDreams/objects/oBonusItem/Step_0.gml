/// @description Update

key_left = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
key_right = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right);
key_select = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);

if ((gamepad_axis_value(0,gp_axislh) < -0.4 && analogLeftPrev == false) || gamepad_button_check_pressed(0,gp_padl))
{
	key_left = 1;
	global.controller = 1;
	analogLeftPrev = true;
}
if ( (gamepad_axis_value(4,gp_axislh) < -0.4 && analogLeftPrevD == false) || gamepad_button_check_pressed(4,gp_padl))
{
	key_left = 1;
	global.controller = 2;
	analogLeftPrev = true;
}

if ((gamepad_axis_value(0,gp_axislh) > 0.4 && analogRightPrev == false) || gamepad_button_check_pressed(0,gp_padr))
{
	key_right = 1;
	global.controller = 1;
	analogRightPrev = true;
}
if ((gamepad_axis_value(4,gp_axislh) > 0.4 && analogRightPrevD == false) || gamepad_button_check_pressed(4,gp_padr))
{
	key_right = 1;
	global.controller = 2;
	analogRightPrev = true;
}

if (gamepad_button_check_pressed(0,gp_face1))
{
	key_select = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(4,gp_face1))
{
	key_select = 1;
	global.controller = 2;
}

if(key_left && !selected)
{
	audio_play_sound(snd_MenuMove,5,false);
	currentItem--;	
	if(currentItem < 0)
	{
		currentItem	= array_length(itemList) - 1;
	}
}

if(key_right && !selected)
{
	audio_play_sound(snd_MenuMove,5,false);
	currentItem++;	
	if(currentItem > array_length(itemList) - 1)
	{
		currentItem = 0;	
	}
}

if(key_select && !selected)
{
	audio_play_sound(snd_MenuSelect,5,false);
	selected = true;
}

if(selected)
{
	if(selectedOffset == 0) 
	{
		selectedOffset = 1;
	}
	else
	{
		selectedOffset *= 1.3;
	}
}

itemOffsetY += itemOffsetYSpeed;
if(itemOffsetY > 1) itemOffsetYSpeed -= 0.1;
if(itemOffsetY < -1) itemOffsetYSpeed += 0.1;

if(gamepad_axis_value(0,gp_axislh) < -0.4)
{
	analogLeftPrev = true;	
}
else
{
	analogLeftPrev = false;	
}

if(gamepad_axis_value(0,gp_axislh) > 0.4)
{
	analogRightPrev = true;	
}
else
{
	analogRightPrev = false;	
}

if(gamepad_axis_value(4,gp_axislh) < -0.4)
{
	analogLeftPrevD = true;	
}
else
{
	analogLeftPrevD = false;	
}

if(gamepad_axis_value(4,gp_axislh) > 0.4)
{
	analogRightPrevD = true;	
}
else
{
	analogRightPrevD = false;	
}