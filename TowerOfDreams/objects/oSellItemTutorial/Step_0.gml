/// @description Get Input

if(global.controller)
{
	sprite_index = sSellItemController;	
}
else
{
	sprite_index = sSellItem;	
}

key_sell = keyboard_check(ord("C")) || keyboard_check(ord("I")) || keyboard_check(vk_rshift);

if (gamepad_button_check(0,gp_face4) || gamepad_button_check(4,gp_face4))
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