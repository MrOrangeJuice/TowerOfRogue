/// @description Get Input

if(global.controller == 2 && !gamepad_is_connected(0))
{
	sprite_index = sHoldJumpControllerPS;	
}
else if(global.controller == 1 || global.controller == 2)
{
	sprite_index = sHoldJumpController;	
}
else
{
	sprite_index = sHoldJump;	
}

key_jump = keyboard_check(vk_space) || keyboard_check(ord("Z")) || keyboard_check(ord("P"));

if (gamepad_button_check(0,gp_face1))
{
	key_jump = 1;
	global.controller = 1;
}
if (gamepad_button_check(4,gp_face1))
{
	key_jump = 1;
	global.controller = 2;
}


if(!global.paused)
{
	if(key_jump)
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