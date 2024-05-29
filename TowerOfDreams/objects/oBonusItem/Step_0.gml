/// @description Update

key_left = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
key_right = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right);
key_select = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);

if ((gamepad_axis_value(0,gp_axislh) < -0.4 && analogLeftPrev == false) || gamepad_button_check_pressed(0,gp_padl))
{
	key_left = 1;
	global.controller = 1;
	analogLeftPrev = true;
}
if ( (gamepad_axis_value(4,gp_axislh) < -0.4 && analogLeftPrevD == false) || gamepad_button_check_pressed(4,gp_padl))
{
	key_left = 1;
	global.controller = 2;
	analogLeftPrev = true;
}

if ((gamepad_axis_value(0,gp_axislh) > 0.4 && analogRightPrev == false) || gamepad_button_check_pressed(0,gp_padr))
{
	key_right = 1;
	global.controller = 1;
	analogRightPrev = true;
}
if ((gamepad_axis_value(4,gp_axislh) > 0.4 && analogRightPrevD == false) || gamepad_button_check_pressed(4,gp_padr))
{
	key_right = 1;
	global.controller = 2;
	analogRightPrev = true;
}

if (gamepad_button_check_pressed(0,gp_face1))
{
	key_select = 1;
	global.controller = 1;
}
if (gamepad_button_check_pressed(4,gp_face1))
{
	key_select = 1;
	global.controller = 2;
}