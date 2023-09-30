event_inherited();

hp = 2;
vsp = 0;
grv = 0.15;
hitWall = true;
alarm[0] = room_speed * (1 + offset);
landing = false;

// Spawn for hard mode
if(global.hardMode && object_index != oGravityEnemyElite)
{
	instance_change(oGravityEnemyElite,false);
	hp = 4;
	grv = 0.2;
	elite = true;
}