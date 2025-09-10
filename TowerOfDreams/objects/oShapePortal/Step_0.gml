if(!global.paused)
{
	image_speed = imageSpeed;
	if(imageSpeed > 1)
		imageSpeed -= 0.02;
}
else
{
	image_speed = 0;	
}