/// @description Update

if(hp <= 0)
{
	instance_create_layer(x,y,"Enemies",oEnemyDeath);
	instance_destroy();	
}