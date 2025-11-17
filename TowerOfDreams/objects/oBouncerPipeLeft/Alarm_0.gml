/// @description Spawn Ball

if(elite)
{
	ball = instance_create_layer(x+50,y+14,"Enemies",oBounceEnemyElite);
}
else
{
	ball = instance_create_layer(x+50,y+14,"Enemies",oBounceEnemy);
}	
ball.vsp = -launchJump;
ball.dir = 1;
ball.givesHealth = false;
ball.image_index = 2;