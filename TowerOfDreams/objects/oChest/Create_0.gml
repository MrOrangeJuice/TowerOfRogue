/// @description Init

colliding = false;
analogUpPrev = false;
analogUpPrevD = false;
if(global.sideChestOpened)
{
	opened = true;
	image_index = 1;
}
else
{
	opened = false;	
}

image_speed = 0;