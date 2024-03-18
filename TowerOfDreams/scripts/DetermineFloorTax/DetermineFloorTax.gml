// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DetermineFloorTax(){
	
	floorTax = 0;
	if(global.levelCount < 3)
	{
		floorTax = 0;	
	}
	else if(global.levelCount < 6)
	{
		floorTax = 1;	
	}
	else if(global.levelCount < 9)
	{
		floorTax = 2;	
	}
	else if(global.levelCount < 12)
	{
		floorTax = 3;	
	}
	
	return floorTax;
}