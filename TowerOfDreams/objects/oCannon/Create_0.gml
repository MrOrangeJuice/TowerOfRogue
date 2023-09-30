event_inherited();

hp = 2;
image_xscale = dir;
alarm[0] = room_speed * (fireGap + offset);

// Spawn for hard mode
if(global.hardMode && (object_index != oCannonElite || object_index != oTankEnemyStationaryElite))
{
	if(object_index == oCannon)
	{
		instance_change(oCannonElite,true);
	}
	else if(object_index == oTankEnemyStationary)
	{
		instance_change(oTankEnemyStationaryElite,true);
	}
}