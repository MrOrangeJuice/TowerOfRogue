/// @description Spawn player

// Setup state of coins and enemies
if(global.inARun)
{
	for(i = 0; i < instance_number(oGem); i++)
	{
		newArray = [instance_find(oGem,i),true];
		ds_list_add(global.coinArray,newArray);
	}
	
	for(i = 0; i < instance_number(oEnemy); i++)
	{
		newArray = [instance_find(oEnemy,i),true];
		ds_list_add(global.enemyArray,newArray);
	}
}

global.canPause = true;
player = instance_create_layer(x,y,"Instances",oPlayer);
instance_destroy();