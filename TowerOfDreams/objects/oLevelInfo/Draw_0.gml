/// @description Draw

draw_set_halign(fa_left);

if(drawLevelNum)
{
	floorNum = 0;
	levelNum = 0;
	if(global.levelCount < 3)
	{
		floorNum = 1;
		levelNum = global.levelCount + 1;
	}
	else if(global.levelCount >= 6)
	{
		floorNum = 3;
		levelNum = global.levelCount - 5;
	}
	else if(global.levelCount >= 3)
	{
		floorNum = 2;
		levelNum = global.levelCount - 2;
	}
	if(global.timeTrial)
	{
		levelString = "TIME TRIAL";
	}
	else
	{
		levelString = "Level " + string(floorNum) + "-" + string(levelNum);
	}
	
	// Draw outline
	draw_set_color(#4d456d);
	draw_text(x,y-39,levelString);
	draw_text(x,y-41,levelString);
	draw_text(x+1,y-40,levelString);
	draw_text(x-1,y-40,levelString);
	
	// Draw text
	draw_set_color(#f0d7b1);
	draw_text(x,y-40,levelString);
}

if(drawLevelName)
{
	draw_set_color(#4d456d);
	draw_text(x,y-31,levelName);
	draw_text(x,y-33,levelName);
	draw_text(x+1,y-32,levelName);
	draw_text(x-1,y-32,levelName);
	
	draw_set_color(#f0d7b1);
	draw_text(x,y-32,levelName);
}

if(drawPrevBest)
{
	if(global.timeTrial)
	{
		if(prevBestTime != 0)
		{
			bestString = "Prev. Best Time: " + string_format((prevBestTime / room_speed), 0, 2);
		}
	}
	else
	{
		bestString = "Prev. Best: " +string(prevBestRank);
	}
	
	draw_set_color(#4d456d);
	draw_text(x,y-23,bestString);
	draw_text(x,y-25,bestString);
	draw_text(x+1,y-24,bestString);
	draw_text(x-1,y-24,bestString);
	
	draw_set_color(#f0d7b1);
	draw_text(x,y-24,bestString);
}

// Reset color
draw_set_color(#4d456d);