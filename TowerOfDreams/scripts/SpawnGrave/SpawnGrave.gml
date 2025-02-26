// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SpawnGrave(){
	// Spawn grave
	switch(room)
	{
		case rFloor1_1:
			if(global.graveX1_1 != 0 && global.graveY1_1 != 0)
			{
				newGrave = instance_create_layer(global.graveX1_1,global.graveY1_1,"Enemies",oPastGrave);
				newGrave.item = global.graveItem1_1;
			}
			break;
		case rFloor1_2:
			if(global.graveX1_2 != 0 && global.graveY1_2 != 0)
			{
				newGrave = instance_create_layer(global.graveX1_2,global.graveY1_2,"Enemies",oPastGrave);
				newGrave.item = global.graveItem1_2;
			}
			break;
		case rFloor1_3:
			if(global.graveX1_3 != 0 && global.graveY1_3 != 0)
			{
				newGrave = instance_create_layer(global.graveX1_3,global.graveY1_3,"Enemies",oPastGrave);
				newGrave.item = global.graveItem1_3;
			}
			break;
		case rFloor1_4:
			if(global.graveX1_4 != 0 && global.graveY1_4 != 0)
			{
				newGrave = instance_create_layer(global.graveX1_4,global.graveY1_4,"Enemies",oPastGrave);
				newGrave.item = global.graveItem1_4;
			}
			break;
		case rFloor1_5:
			if(global.graveX1_5 != 0 && global.graveY1_5 != 0)
			{
				newGrave = instance_create_layer(global.graveX1_5,global.graveY1_5,"Enemies",oPastGrave);
				newGrave.item = global.graveItem1_5;
			}
			break;
		case rFloor1_6:
			if(global.graveX1_6 != 0 && global.graveY1_6 != 0)
			{
				newGrave = instance_create_layer(global.graveX1_6,global.graveY1_6,"Enemies",oPastGrave);
				newGrave.item = global.graveItem1_6;
			}
			break;
		case rFloor2_1:
			if(global.graveX2_1 != 0 && global.graveY2_1 != 0)
			{
				newGrave = instance_create_layer(global.graveX2_1,global.graveY2_1,"Enemies",oPastGrave);
				newGrave.item = global.graveItem2_1;
			}
			break;
		case rFloor2_2:
			if(global.graveX2_2 != 0 && global.graveY2_2 != 0)
			{
				newGrave = instance_create_layer(global.graveX2_2,global.graveY2_2,"Enemies",oPastGrave);
				newGrave.item = global.graveItem2_2;
			}
			break;
		case rFloor2_3:
			if(global.graveX2_3 != 0 && global.graveY2_3 != 0)
			{
				newGrave = instance_create_layer(global.graveX2_3,global.graveY2_3,"Enemies",oPastGrave);
				newGrave.item = global.graveItem2_3;
			}
			break;
		case rFloor2_4:
			if(global.graveX2_4 != 0 && global.graveY2_4 != 0)
			{
				newGrave = instance_create_layer(global.graveX2_4,global.graveY2_4,"Enemies",oPastGrave);
				newGrave.item = global.graveItem2_4;
			}
			break;
		case rFloor2_5:
			if(global.graveX2_5 != 0 && global.graveY2_5 != 0)
			{
				newGrave = instance_create_layer(global.graveX2_5,global.graveY2_5,"Enemies",oPastGrave);
				newGrave.item = global.graveItem2_5;
			}
			break;
		case rFloor3_1:
			if(global.graveX3_1 != 0 && global.graveY3_1 != 0)
			{
				newGrave = instance_create_layer(global.graveX3_1,global.graveY3_1,"Enemies",oPastGrave);
				newGrave.item = global.graveItem3_1;
			}
			break;
		case rFloor3_2:
			if(global.graveX3_2 != 0 && global.graveY3_2 != 0)
			{
				newGrave = instance_create_layer(global.graveX3_2,global.graveY3_2,"Enemies",oPastGrave);
				newGrave.item = global.graveItem3_2;
			}
			break;
		case rFloor3_3:
			if(global.graveX3_3 != 0 && global.graveY3_3 != 0)
			{
				newGrave = instance_create_layer(global.graveX3_3,global.graveY3_3,"Enemies",oPastGrave);
				newGrave.item = global.graveItem3_3;
			}
			break;
		case rFloor3_4:
			if(global.graveX3_4 != 0 && global.graveY3_4 != 0)
			{
				newGrave = instance_create_layer(global.graveX3_4,global.graveY3_4,"Enemies",oPastGrave);
				newGrave.item = global.graveItem3_4;
			}
			break;
        case rFloor4_1:
            if(global.graveX4_1 != 0 && global.graveY4_1 != 0)
            {
                newGrave = instance_create_layer(global.graveX4_1,global.graveY4_1,"Enemies",oPastGrave);
                newGrave.item = global.graveItem4_1;
            }
            break; 
        case rFloor4_2:
            if(global.graveX4_2 != 0 && global.graveY4_2 != 0)
            {
                newGrave = instance_create_layer(global.graveX4_2,global.graveY4_2,"Enemies",oPastGrave);
                newGrave.item = global.graveItem4_2;
            }
            break;
        case rFloor4_3:
            if(global.graveX4_3 != 0 && global.graveY4_3 != 0)
            {
                newGrave = instance_create_layer(global.graveX4_3,global.graveY4_3,"Enemies",oPastGrave);
                newGrave.item = global.graveItem4_3;
            }
            break;
	}
}