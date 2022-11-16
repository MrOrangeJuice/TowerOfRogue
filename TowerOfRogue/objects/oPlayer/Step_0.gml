// Get Player Input

key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_jump = keyboard_check(vk_space) || keyboard_check(ord("Z")) || keyboard_check(ord("P"));
key_jump_released = keyboard_check_released(vk_space) || keyboard_check_released(ord("Z")) || keyboard_check_released(ord("P"));

if (key_left) || (key_right) || (key_jump)
{
	global.controller = 0;
}

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

if (gamepad_button_check(0,gp_face1) || gamepad_button_check(4,gp_face1))
{
	key_jump = 1;
	global.controller = 1;
}

if (gamepad_button_check_released(0,gp_face1) || gamepad_button_check_released(4,gp_face1))
{
	key_jump_released = 1;
	global.controller = 1;
}

// If player doesn't release jump, they can't jump again
if(key_jump_released)
{
	canJump = true;
}

// Build up speed depending on inputs
if(key_left && !key_right)
{
	currentwalksp -= 0.25;
	if(currentwalksp < (-walksp - 0.5))
	{
		currentwalksp += 0.5;
	}
	else if(currentwalksp < -walksp)
	{
		currentwalksp += 0.25;
	}
}
if(key_right && !key_left)
{
	currentwalksp += 0.25;
	if(currentwalksp > (walksp + 0.5))
	{
		currentwalksp -= 0.5;
	}
	else if(currentwalksp > walksp)
	{
		currentwalksp -= 0.25;
	}
}
// Slow down if not moving
if (!(key_left || key_right) || (key_left && key_right))
{
	if(currentwalksp < 0)
	{
		currentwalksp += 0.25;
	}
	if(currentwalksp > 0)
	{
		currentwalksp -= 0.25;
	}
}
	
hsp = currentwalksp;
vsp = vsp + grv;

// Decrement jump buffer
jumpBuffer--;
	
// Check if player is airborne
if(!place_meeting(x, y + 1, oWall))
{
	airborne = true;	
}
else
{
	airborne = false;	
	jumpBuffer = 5;
}

if (jumpBuffer > 0) && (key_jump) && (canJump)
{
	vsp = -3;
	instance_create_layer(x,y,"VFX",oDust);
	audio_play_sound(snd_Jump, 5, false);
	canJump = false;
}

// Variable jump height
if vsp < 0 && (!(key_jump)) //if you're moving upwards in the air but not holding down jump
{
	vsp *= 0.85; //essentially, divide your vertical speed
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
x = x + hsp;

// Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

// Animation

if(prevAirborne && !airborne)
{
	landing = true;
	instance_create_layer(x,y,"VFX",oDustSmall);
	audio_play_sound(snd_Land, 5, false);
	sprite_index = sPlayerLand;
}

if(airborne && !landing)
{
	if (vsp <= 0) 
	{
		sprite_index = sPlayerJump;
	}
	if (vsp > 0)
	{
		sprite_index = sPlayerFall;
	}
}
else if(!landing)
{
	if (hsp != 0)
	{
		sprite_index = sPlayerRun;
	}
	else
	{
		sprite_index = sPlayerIdle;
	}
}

if (hsp != 0) image_xscale = sign(hsp);

prevAirborne = airborne;