/// @description Get Input

if(global.controller == 2 && !gamepad_is_connected(0))
{
	sprite_index = sSellItemControllerPS;	
}
else if(global.controller == 1 || global.controller == 2)
{
	sprite_index = sSellItemController;	
}
else
{
	sprite_index = sSellItem;	
}

key_sell = keyboard_check(ord("C")) || keyboard_check(ord("I")) || keyboard_check(vk_rshift);

if (gamepad_button_check(0,gp_face4))
{
	key_sell = 1;
	global.controller = 1;
}
if (gamepad_button_check(4,gp_face4))
{
	key_sell = 1;
	global.controller = 2;
}

if(!global.paused)
{
	if(key_sell)
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