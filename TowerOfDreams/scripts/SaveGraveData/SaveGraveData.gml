// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SaveGraveData(argument0,argument1){
	// Determine item
	item = -1;
	randomize();
	
	// Version with both
	if(global.item != -1 && array_length(global.passiveItems) != 0)
	{
		randItem = irandom_range(0,array_length(global.passiveItems));
		// Active item
		if(randItem == array_length(global.passiveItems))
		{
			item = global.item;
		}
		// Passive item
		else
		{
			// Find index of passive item in main item list
			for(i = 0; i < array_length(global.itemObjects); i++)
			{
				if(global.itemObjects[i] == global.passiveItemObjects[global.passiveItems[randItem]])
				{
					item = i;	
				}
			}
		}
			
	}
	// Version without passive items
	else if(global.item != -1)
	{
		item = global.item;
	}
	// Version without active item
	else if(array_length(global.passiveItems) != 0)
	{
		randItem = irandom_range(0,array_length(global.passiveItems) - 1);
		for(i = 0; i < array_length(global.itemObjects); i++)
		{
			if(global.itemObjects[i] == global.passiveItemObjects[global.passiveItems[randItem]])
			{
				item = i;	
			}
		}
	}
	// If no item, leave heart
	else if(array_length(global.passiveItems) == 0 && global.item == -1)
	{
		item = array_length(global.itemObjects)-1;
	}
	
	// Save data
	switch(room)
	{
		case rFloor1_1:
			global.graveX1_1 = argument0;
			global.graveY1_1 = argument1;
			global.graveItem1_1 = item;
			break;
		case rFloor1_2:
			global.graveX1_2 = argument0;
			global.graveY1_2 = argument1;
			global.graveItem1_2 = item;
			break;
		case rFloor1_3:
			global.graveX1_3 = argument0;
			global.graveY1_3 = argument1;
			global.graveItem1_3 = item;
			break;
		case rFloor1_4:
			global.graveX1_4 = argument0;
			global.graveY1_4 = argument1;
			global.graveItem1_4 = item;
			break;
		case rFloor1_5:
			global.graveX1_5 = argument0;
			global.graveY1_5 = argument1;
			global.graveItem1_5 = item;
			break;
		case rFloor1_6:
			global.graveX1_6 = argument0;
			global.graveY1_6 = argument1;
			global.graveItem1_6 = item;
			break;
		case rFloor2_1:
			global.graveX2_1 = argument0;
			global.graveY2_1 = argument1;
			global.graveItem2_1 = item;
			break;
		case rFloor2_2:
			global.graveX2_2 = argument0;
			global.graveY2_2 = argument1;
			global.graveItem2_2 = item;
			break;
		case rFloor2_3:
			global.graveX2_3 = argument0;
			global.graveY2_3 = argument1;
			global.graveItem2_3 = item;
			break;
		case rFloor2_4:
			global.graveX2_4 = argument0;
			global.graveY2_4 = argument1;
			global.graveItem2_4 = item;
			break;
		case rFloor2_5:
			global.graveX2_5 = argument0;
			global.graveY2_5 = argument1;
			global.graveItem2_5 = item;
			break;
		case rFloor3_1:
			global.graveX3_1 = argument0;
			global.graveY3_1 = argument1;
			global.graveItem3_1 = item;
			break;
		case rFloor3_2:
			global.graveX3_2 = argument0;
			global.graveY3_2 = argument1;
			global.graveItem3_2 = item;
			break;
		case rFloor3_3:
			global.graveX3_3 = argument0;
			global.graveY3_3 = argument1;
			global.graveItem3_3 = item;
			break;
		case rFloor3_4:
			global.graveX3_4 = argument0;
			global.graveY3_4 = argument1;
			global.graveItem3_4 = item;
			break;
        case rFloor4_1:
            global.graveX4_1 = argument0;
            global.graveY4_1 = argument1;
            global.graveItem4_1 = item;
            break;
        case rFloor4_2:
            global.graveX4_2 = argument0;
            global.graveY4_2 = argument1;
            global.graveItem4_2 = item;
            break;
        case rFloor4_3:
            global.graveX4_3 = argument0;
            global.graveY4_3 = argument1;
            global.graveItem4_3 = item;
            break;
	}
	Save();
}