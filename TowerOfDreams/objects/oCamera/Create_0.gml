/// @description Setup camera

cam = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;

// Move camera to pipe if necessary

if (instance_exists(oShopPipe) && global.shopPipeCount == 3)
{
	follow = oShopPipe;
	//xTo = follow.x;
	yTo = follow.y;
	y = global.shopY;
}

if (instance_exists(oPipe) && global.pipeCount == 3)
{
	follow = oPipe;
	//xTo = follow.x;
	yTo = follow.y;
	y = global.pipeY;
}