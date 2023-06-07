/// @description Spawn pipe

// If pipe was already spawned for this room, spawn it at the same place again
if(global.shopY != 0)
{
	instance_create_layer(x-24,global.shopY-2,"Pipes",oShopPipe);
	// Set camera to pipe
	oCamera.y = global.shopY;
}

while(!global.shopSpawned)
{
	// Check if it's in a corner
	if(place_meeting(x-1,y,oWall) && place_meeting(x,y+1,oWall) && !place_meeting(x-1,y,oSpikes) && !place_meeting(x,y+1,oSpikes) && !place_meeting(x,y,oWall) && y > oPortal.y)
	{
		randomize();
		randomChance = irandom_range(0,2);
		if(randomChance == 1)
		{
			// Randomly create pipe
			instance_create_layer(x-28,y-2,"Pipes",oShopPipe);
			global.shopSpawned = true;
			global.shopY = y;
		}
	}
	// Check if it's at the top
	if(y <= 0)
	{
		break;
	}
	y-=8;
}

instance_destroy();