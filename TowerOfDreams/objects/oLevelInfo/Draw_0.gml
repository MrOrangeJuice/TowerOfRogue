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
	levelString = "Level " + string(floorNum) + "-" + string(levelNum);
	draw_text(x,y-40,levelString);
}

if(drawLevelName)
{
	draw_text(x,y-32,levelName);
}

if(drawPrevBest)
{
	bestString = "Prev. Best: " +string(prevBestRank);
	draw_text(x,y-24,bestString);
}
