/// @description Fire

if(firing)
{
	firing = false;
	missile = instance_create_layer(x+(dir*14),y,"Enemies",oMissile);
	if(dir == 1) missile.dir = "right";
	alarm[3] = room_speed * 2;
}