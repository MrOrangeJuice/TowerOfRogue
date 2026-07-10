show_debug_message("async system message received:" + string(json_encode(async_load)));

/// @description Pick up the pad settings here
var type = ds_map_find_value(async_load, "event_type");

if (type == "gamepad lost" && !disableDisconnect) 
{
	alarm[3] = room_speed * 5;
}