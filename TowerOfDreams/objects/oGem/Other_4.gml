/// @description Destroy if already collected

listSize = ds_list_size(global.coinArray);
for(i = 0; i < listSize; i++)
{
	coinData = array_create(2);
	coinData = global.coinArray[| i];
	if(coinData[0] == id && coinData[1] == false)
	{
		// Destroy if coin is false in list
		instance_destroy();
	}
}