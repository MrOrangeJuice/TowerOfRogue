/// @description Spawn dust

// Spawn VFX
randomize();
if(place_meeting(x,y+1,oWall)) instance_create_layer(x + (2*-dir) + random_range(-2,2),y + 6 + random_range(-1,1),"VFX",oDustWallSmall);
alarm[0] = room_speed * 0.1;