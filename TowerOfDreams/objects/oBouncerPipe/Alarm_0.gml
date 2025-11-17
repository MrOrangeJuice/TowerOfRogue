/// @description Spawn ball

if(elite)
{
	ball = instance_create_layer(x+6,y+14,"Enemies",oBounceEnemyElite);
}
else
{
	ball = instance_create_layer(x+6,y+14,"Enemies",oBounceEnemy);
}	
ball.vsp = -launchJump;
ball.givesHealth = false;
ball.image_index = 2;