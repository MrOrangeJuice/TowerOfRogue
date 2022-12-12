/// @description Update

key_restart = keyboard_check_pressed(ord("R"));

if (key_restart)
{
	global.controller = 0;
}

if (gamepad_button_check_pressed(0,gp_select))
{
	key_restart = 1;
	global.controller = 1;
}

if(key_restart)
{
	game_restart();
}