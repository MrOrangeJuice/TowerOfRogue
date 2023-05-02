/// @description Destroy if already killed

listSize = ds_list_size(global.enemyArray);
for(i = 0; i < listSize; i++)
{
	enemyData = array_create(2);
	enemyData = global.enemyArray[| i];
	if(enemyData[0] == id && enemyData[1] == false)
	{
		// Destroy if enemy is false in list
		instance_destroy();
	}
}