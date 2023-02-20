/// @description Get Input

key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);

// Gamepad input
if (gamepad_axis_value(0,gp_axislh) < -0.2 || gamepad_button_check(0,gp_padl) || gamepad_axis_value(4,gp_axislh) < -0.2 || gamepad_button_check(4,gp_padl))
{
	key_left = 1;
	global.controller = 1;
}

if (gamepad_axis_value(0,gp_axislh) > 0.2 || gamepad_button_check(0,gp_padr) || gamepad_axis_value(4,gp_axislh) > 0.2 || gamepad_button_check(4,gp_padr))
{
	key_right = 1;
	global.controller = 1;
}

if(!global.paused)
{
	if(key_left && key_right)
	{
		image_index = 3;	
	}
	else if(key_left)
	{
		image_index = 1;	
	}
	else if(key_right)
	{
		image_index = 2;	
	}
	else
	{
		image_index = 0;
	}	
}
else
{
	
}
