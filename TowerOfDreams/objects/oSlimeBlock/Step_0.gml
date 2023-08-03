/// @description Check for player

if(!global.paused)
{
	if(justUnpaused)
	{
		justUnpaused = false;
		image_speed = prevImageSpeed;
	}
	
	if(place_meeting(x-1,y,oPlayer) && !leftEyeClosing)
	{
		playerSeenLeft = true;
	}
	else if(playerSeenLeft)
	{
		playerSeenLeft = false;
		leftEyeClosing = true;
		image_speed = 1;
		image_index = 0;
	}
	
	if(place_meeting(x+1,y,oPlayer) && !rightEyeClosing)
	{
		playerSeenRight = true;
	}
	else if(playerSeenRight)
	{
		playerSeenRight = false;
		rightEyeClosing = true;
		image_speed = 1;
		image_index = 0;
	}
	
	// Animation
	if(playerSeenLeft)
	{
		sprite_index = sSlimeBlockLeft;	
	}
	else if(leftEyeClosing)
	{
		sprite_index = sSlimeBlockLeftClose;
	}
	else if(playerSeenRight)
	{
		sprite_index = sSlimeBlockRight;	
	}
	else if(rightEyeClosing)
	{
		sprite_index = sSlimeBlockRightClose;
	}
	else
	{
		sprite_index = sSlimeBlock;	
	}
}
else
{
	if(!justUnpaused) prevImageSpeed = image_speed;
	justUnpaused = true;
	image_speed = 0;	
}