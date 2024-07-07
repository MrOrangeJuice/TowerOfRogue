// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SpawnPepperExplosion(argument0,argument1){
	pepperInItems = false;
	pepperNum = 0;
	for(i = 0; i < array_length(global.passiveItems); i++)
	{
		if(global.passiveItems[i] == 16)
		{
			pepperInItems = true;
			pepperNum++;
		}
	}

	if(pepperInItems) 
	{
		explosion = instance_create_layer(argument0,argument1,"Enemies",oPepperExplosion);
		explosion.damage = pepperNum;
	}
}