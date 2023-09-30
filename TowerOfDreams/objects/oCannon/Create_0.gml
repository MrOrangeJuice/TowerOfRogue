event_inherited();

hp = 2;
image_xscale = dir;
alarm[0] = room_speed * (fireGap + offset);

// Spawn for hard mode
if(global.hardMode && !elite)
{
	if(object_index == oCannon)
	{
		hardEnemy = instance_create_layer(x,y,"Enemies",oCannonElite);
		hardEnemy.dir = dir;
		hardEnemy.offset = offset;
		hardEnemy.fireGap = fireGap;
	}
	else if(object_index == oTankEnemyStationary)
	{
		hardEnemy = instance_create_layer(x,y,"Enemies",oTankEnemyStationaryElite);
		hardEnemy.dir = dir;
		hardEnemy.offset = offset;
		hardEnemy.fireGap = fireGap;
	}
	instance_destroy();
}