event_inherited();

hp = 2;
vsp = 0;
grv = 0.15;
hitWall = true;
alarm[0] = room_speed * (1 + offset);
landing = false;

// Spawn for hard mode
if(global.hardMode && !elite)
{
	hardEnemy = instance_create_layer(x,y,"Enemies",oGravityEnemyElite);
	hardEnemy.offset = offset;
	instance_destroy();
}