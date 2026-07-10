// Change controls

switch_controller_support_set_singleplayer_only(true);  
var _style = switch_controller_handheld | switch_controller_pro_controller | switch_controller_joycon_dual;
switch_controller_set_supported_styles(_style);
switch_controller_support_show();  
global.ControllerId = switch_controller_support_get_selected_id(); 
disableDisconnect = true;
alarm[4] = room_speed * 0.5;