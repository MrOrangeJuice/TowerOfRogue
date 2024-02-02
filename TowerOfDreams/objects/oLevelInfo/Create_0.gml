/// @description Start alarms

alarm[0] = room_speed * 0.5;
alarm[1] = room_speed * 1;

// Determine if player has a previous best and what that is
prevBestRank = "F";

switch(room)
{
	case rFloor1_1:
		if(global.best1_1 != "F") 
		{
			alarm[2] = room_speed * 1.5;
			prevBestRank = global.best1_1;
		}
		break;
	case rFloor1_2:
		if(global.best1_2 != "F") 
		{
			alarm[2] = room_speed * 1.5;
			prevBestRank = global.best1_2;
		}
		break;
	case rFloor1_3:
		if(global.best1_3 != "F") 
		{
			alarm[2] = room_speed * 1.5;
			prevBestRank = global.best1_3;
		}
		break;
	case rFloor1_4:
		if(global.best1_4 != "F") 
		{
			alarm[2] = room_speed * 1.5;
			prevBestRank = global.best1_4;
		}
		break;
	case rFloor1_5:
		if(global.best1_5 != "F") 
		{
			alarm[2] = room_speed * 1.5;
			prevBestRank = global.best1_5;
		}
		break;
	case rFloor1_6:
		if(global.best1_6 != "F") 
		{
			alarm[2] = room_speed * 1.5;
			prevBestRank = global.best1_6;
		}
		break;
	case rFloor2_1:
		if(global.best2_1 != "F") 
		{
			alarm[2] = room_speed * 1.5;
			prevBestRank = global.best2_1;
		}
		break;
	case rFloor2_2:
		if(global.best2_2 != "F") 
		{
			alarm[2] = room_speed * 1.5;
			prevBestRank = global.best2_2;
		}
		break;
	case rFloor2_3:
		if(global.best2_3 != "F") 
		{
			alarm[2] = room_speed * 1.5;
			prevBestRank = global.best2_3;
		}
		break;
	case rFloor2_4:
		if(global.best2_4 != "F") 
		{
			alarm[2] = room_speed * 1.5;
			prevBestRank = global.best2_4;
		}
		break;
	case rFloor3_1:
		if(global.best3_1 != "F") 
		{
			alarm[2] = room_speed * 1.5;
			prevBestRank = global.best3_1;
		}
		break;
	case rFloor3_2:
		if(global.best3_2 != "F") 
		{
			alarm[2] = room_speed * 1.5;
			prevBestRank = global.best3_2;
		}
		break;
	case rFloor3_3:
		if(global.best3_3 != "F") 
		{
			alarm[2] = room_speed * 1.5;
			prevBestRank = global.best3_3;
		}
		break;
}

drawLevelNum = false;
drawLevelName = false;
drawPrevBest = false;