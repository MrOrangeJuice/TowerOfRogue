/// @description Move

event_inherited();

if(!global.paused && !global.hitStop)
{
	image_speed = 1;

	// If no ground in front of you change direction
	if (!place_meeting(x+(turnCheck*xDir),y,oWall) && xDir != 0)
	{
		xDir = 0;
		// Determine what y direction to go
		if(place_meeting(x,y+turnCheck,oWall)) yDir = 1;
		else if(place_meeting(x,y-turnCheck,oWall)) yDir = -1;
	}
	
	if (!place_meeting(x,y+(turnCheck*yDir),oWall) && yDir != 0)
	{
		yDir = 0;
		// Determine what x direction to go
		if(place_meeting(x+turnCheck,y,oWall)) xDir = 1;
		else if(place_meeting(x-turnCheck,y,oWall)) xDir = -1;
	}
	


	x += (xDir * initialSpeed);
	y += (yDir * initialSpeed);
}
else
{
	image_speed = 0;	
}