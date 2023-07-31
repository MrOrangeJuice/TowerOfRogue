/// @description Spawn Ball

if(elite)
{
	ball = instance_create_layer(x+58,y+14,"Enemies",oBallEnemyElite);
}
else
{
	ball = instance_create_layer(x+58,y+14,"Enemies",oBallEnemy);
}	
ball.vsp = -launchJump;
ball.dir = 1;
ball.givesHealth = false;