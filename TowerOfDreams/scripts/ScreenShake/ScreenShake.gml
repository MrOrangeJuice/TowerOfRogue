/// @desc ScreenShake(magnitude,frames)
/// @arg Magnitude sets the strength of the shake (radius in pixels)
/// @sarg Frames sets the length of the shake in frames (60 = 1 second at 60fps)
function ScreenShake(argument0, argument1) {

	with (oCamera)
	{
		if(argument0 > shake_remain)
		{
			shake_magnitude = argument0;
			shake_remain = argument0;
			shake_length = argument1;
		}
	}
	
	with (oFullCamera)
	{
		if(argument0 > shake_remain)
		{
			shake_magnitude = argument0;
			shake_remain = argument0;
			shake_length = argument1;
		}
	}


}
