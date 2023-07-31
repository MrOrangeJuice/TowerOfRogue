/// @description Spawn ball

if(elite)
{
	ball = instance_create_layer(x+6,y+14,"Enemies",oBallEnemyElite);
}
else
{
	ball = instance_create_layer(x+6,y+14,"Enemies",oBallEnemy);
}	
ball.vsp = -launchJump;
ball.givesHealth = false;