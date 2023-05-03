/// @description Spawn more shockwaves

// Spawn shock waves
instance_create_layer(shockX,shockY,"Instances",oShockwave);
rightShock = instance_create_layer(shockX,shockY,"Instances",oShockwave);
rightShock.dir = 1;
shockNum--;
if(shockNum > 0)
{
	alarm[6] = room_speed * 0.1;	
}