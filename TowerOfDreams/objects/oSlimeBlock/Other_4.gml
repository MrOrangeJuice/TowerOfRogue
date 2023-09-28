/// @description Destroy if already killed

listSize = ds_list_size(global.slimeArray);
for(i = 0; i < listSize; i++)
{
	slimeData = array_create(2);
	slimeData = global.slimeArray[| i];
	if(slimeData[0] == id && slimeData[1] == false)
	{
		// Destroy if slime is false in list
		instance_destroy();
	}
}