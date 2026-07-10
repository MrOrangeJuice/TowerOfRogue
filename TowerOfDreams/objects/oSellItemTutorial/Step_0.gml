/// @description Get Input

if(global.controller == 1)
{
	sprite_index = sSellItemController;	
}
else
{
	sprite_index = sSellItem;	
}

key_sell = keyboard_check(ord("C")) || keyboard_check(ord("I")) || keyboard_check(vk_rshift);

if (gamepad_button_check(global.ControllerId,gp_face3))
{
	key_sell = 1;
	global.controller = 1;
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