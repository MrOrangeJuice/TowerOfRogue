// Check for input

key_select_pressed = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_space);
key_select = keyboard_check(ord("Z")) || keyboard_check(ord("P")) || keyboard_check(vk_space);

if(key_select_pressed || key_select)
{
	global.controller = 0;	
}

if(gamepad_button_check_pressed(0,gp_face1))
{
	key_select_pressed = true;
	global.controller = 1;
}
if(gamepad_button_check_pressed(4,gp_face1))
{
	key_select_pressed = true;
	global.controller = 2;
}

if(gamepad_button_check(0,gp_face1))
{
	key_select = true;
	global.controller = 1;
}
if(gamepad_button_check(4,gp_face1))
{
	key_select = true;
	global.controller = 2;
}

if(key_select_pressed)
{
	audio_play_sound(snd_MenuSelect,5,false);	
	
	endEarly = true;
	studioVisDir = -1;
	creditVisDir = -1;
	
	alarm[4] = room_speed * 0.5;
}

if(studioVisDir == 1)
{
	studioVis += 3;	
}
if(studioVisDir == -1)
{
	studioVis -= 3;	
}

if(creditVisDir == 1)
{
	creditVis += 3;	
}
if(creditVisDir == -1)
{
	creditVis -= 3;	
}