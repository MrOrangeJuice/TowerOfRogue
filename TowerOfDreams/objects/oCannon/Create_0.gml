event_inherited();

hp = 2;
image_xscale = dir;
alarm[0] = room_speed * (fireGap + offset);
oldDir = dir;

// Spawn for hard mode
if(global.hardMode && (object_index != oCannonElite || object_index != oTankEnemyStationaryElite || object_index != oCannonCloudElite || object_index != oFirePlantElite))
{
	if(object_index == oCannon)
	{
		instance_change(oCannonElite,false);
		hp = 4;
		elite = true;
	}
	else if(object_index == oTankEnemyStationary)
	{
		instance_change(oTankEnemyStationaryElite,false);
		hp = 4;
		elite = true;
	}
	else if(object_index == oCannonCloud)
	{
		instance_change(oCannonCloudElite,false);
		hp = 4;
		elite = true;
	}
	else if(object_index == oFirePlant)
	{
		instance_change(oFirePlantElite,false);
		hp = 4;
		elite = true;
	}
}