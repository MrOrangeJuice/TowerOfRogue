/// @description Spawn more shockwaves for heavy boots

// Spawn shock waves
instance_create_layer(bootsX,bootsY,"Instances",oShockwave);
rightShock = instance_create_layer(bootsX,bootsY,"Instances",oShockwave);
rightShock.dir = 1;
heavyBootsNum--;
if(heavyBootsNum > 0)
{
	alarm[11] = room_speed * 0.1;	
}