/// @description Update

key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_jump_pressed = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("P"));
key_item_pressed = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(ord("O")) || keyboard_check_pressed(vk_lshift);

if (key_left || key_right || key_jump_pressed || key_item_pressed)
{
	global.controller = 0;
}

// Gamepad input
if (gamepad_axis_value(0,gp_axislh) < -0.2 || gamepad_button_check(0,gp_padl))
{
	key_left = 1;
	global.controller = 1;
}
if (gamepad_axis_value(4,gp_axislh) < -0.2 || gamepad_button_check(4,gp_padl))
{
	key_left = 1;
	global.controller = 2;
}

if (gamepad_axis_value(0,gp_axislh) > 0.2 || gamepad_button_check(0,gp_padr))
{
	key_right = 1;
	global.controller = 1;
}
if (gamepad_axis_value(4,gp_axislh) > 0.2 || gamepad_button_check(4,gp_padr))
{
	key_right = 1;
	global.controller = 2;
}

if (gamepad_button_check_pressed(0,gp_face1))
{
	key_jump_pressed = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(4,gp_face1))
{
	key_jump_pressed = 1;
	global.controller = 2;
}

if (gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(0,gp_face3))
{
	key_item_pressed = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(4,gp_face2) || gamepad_button_check_pressed(4,gp_face3))
{
	key_item_pressed = 1;
	global.controller = 2;
}

if(!global.paused)
{
	image_speed = 1;
	// Build up speed depending on inputs
	if(key_left && !key_right)
	{
		if(currentwalksp == -walksp)
		{
			// Don't do anything
		}
		else if(currentwalksp < -walksp) 
		{
			currentwalksp += acceleration;
		}
		else
		{
			currentwalksp -= acceleration;
		}
	}
	if(key_right && !key_left)
	{
		if(currentwalksp == walksp)
		{
			// Don't do anything
		}
		else if(currentwalksp > walksp) 
		{
			currentwalksp -= acceleration;
		}
		else
		{
			currentwalksp += acceleration;
		}
	}
	// Slow down if not moving
	if (!(key_left || key_right) || (key_left && key_right))
	{
		if(currentwalksp < 0)
		{
			currentwalksp += acceleration;
		}
		if(currentwalksp > 0)
		{
			currentwalksp -= acceleration;
		}
	}

	hsp = currentwalksp;
	vsp = vsp + grv;
	// Clamp fall speed
	if(vsp > maxFallSpeed)
	{
		vsp = maxFallSpeed;	
	}

	// Jump
	if(key_jump_pressed)
	{
		vsp = -2;
		audio_play_sound(snd_Flap,5,false);
	}
	
	// Lay Egg
	if(key_item_pressed)
	{
		instance_create_layer(x-4,y+4,"Walls",oEgg);	
		audio_play_sound(snd_Kunai,5,false);
		vsp = -1;
	}

	// Horizontal Collision
	if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}

	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}

	x += hsp;
	y += vsp;

	// Animation
	if (hsp != 0) image_xscale = sign(hsp);
}
else
{
	image_speed = 0;	
}