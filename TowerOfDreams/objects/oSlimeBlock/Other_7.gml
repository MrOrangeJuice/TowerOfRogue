/// @description Pause at end of animation

if(playerSeenLeft || playerSeenRight)
{
	image_speed = 0;
	image_index = 2;
}

if(leftEyeClosing || rightEyeClosing)
{	
	sprite_index = sSlimeBlock;
	leftEyeClosing = false;
	rightEyeClosing = false;
}