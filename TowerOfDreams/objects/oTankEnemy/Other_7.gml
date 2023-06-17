/// @description Fire

if(firing)
{
	firing = false;
	instance_create_layer(x+(dir*18),y-3,"Enemies",oMissile);
	alarm[3] = room_speed * 2;
}