// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DeleteGraveData(){
	switch(room)
	{
		case rFloor1_1:
			global.graveX1_1 = 0;
			global.graveY1_1 = 0;
			global.graveItem1_1 = -1;
			break;
		case rFloor1_2:
			global.graveX1_2 = 0;
			global.graveY1_2 = 0;
			global.graveItem1_2 = -1;
			break;
		case rFloor1_3:
			global.graveX1_3 = 0;
			global.graveY1_3 = 0;
			global.graveItem1_3 = -1;
			break;
		case rFloor1_4:
			global.graveX1_4 = 0;
			global.graveY1_4 = 0;
			global.graveItem1_4 = -1;
			break;
		case rFloor1_5:
			global.graveX1_5 = 0;
			global.graveY1_5 = 0;
			global.graveItem1_6 = -1;
			break;
		case rFloor1_6:
			global.graveX1_6 = 0;
			global.graveY1_6 = 0;
			global.graveItem1_6 = -1;
			break;
		case rFloor2_1:
			global.graveX2_1 = 0;
			global.graveY2_1 = 0;
			global.graveItem2_1 = -1;
			break;
		case rFloor2_2:
			global.graveX2_2 = 0;
			global.graveY2_2 = 0;
			global.graveItem2_2 = -1;
			break;
		case rFloor2_3:
			global.graveX2_3 = 0;
			global.graveY2_3 = 0;
			global.graveItem2_3 = -1;
			break;
		case rFloor2_4:
			global.graveX2_4 = 0;
			global.graveY2_4 = 0;
			global.graveItem2_4 = -1;
			break;
		case rFloor2_5:
			global.graveX2_5 = 0;
			global.graveY2_5 = 0;
			global.graveItem2_5 = -1;
			break;
		case rFloor3_1:
			global.graveX3_1 = 0;
			global.graveY3_1 = 0;
			global.graveItem3_1 = -1;
			break;
		case rFloor3_2:
			global.graveX3_2 = 0;
			global.graveY3_2 = 0;
			global.graveItem3_2 = -1;
			break;
		case rFloor3_3:
			global.graveX3_3 = 0;
			global.graveY3_3 = 0;
			global.graveItem3_3 = -1;
			break;
		case rFloor3_4:
			global.graveX3_4 = 0;
			global.graveY3_4 = 0;
			global.graveItem3_4 = -1;
			break;
	}
	Save();
}