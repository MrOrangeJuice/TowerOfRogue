/// @description Get Input

if(global.controller == 2 && !gamepad_is_connected(0))
{
	sprite_index = sEggControllerPS;	
}
else if(global.controller == 1 || global.controller == 2)
{
	sprite_index = sEggController;	
}
else
{
	sprite_index = sEggT;	
}

key_item = keyboard_check(ord("X")) || keyboard_check(ord("O")) || keyboard_check(vk_lshift);

if (gamepad_button_check(0,gp_face2) || gamepad_button_check(0,gp_face3))
{
	key_item = 1;
	global.controller = 1;
}
if (gamepad_button_check(4,gp_face2) || gamepad_button_check(4,gp_face3))
{
	key_item = 1;
	global.controller = 2;
}

if(!global.paused)
{
	if(key_item)
	{
		image_index = 1;	
	}
	else
	{
		image_index = 0;	
	}
}
else
{
	
}