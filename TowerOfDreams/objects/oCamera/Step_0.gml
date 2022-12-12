/// @description Update camera
// Update destination
if (instance_exists(oPlayer))
{
	//xTo = follow.x;
	yTo = follow.y;
}

// Update object position
//dX = (xTo - x) / 8;
dY = (yTo - y) / 8;

//reduce subpixel movement
//if (abs(dX) < 0.2) dX = 0;
if (abs(dY) < 0.2) dY = 0;

//x += dX;
y += dY;

// Keep camera center inside room
//x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

// Screen shake
//x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

// Update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

// Parallax
if (layer_exists("Background"))
{
	layer_x("Background",x/10);
	layer_y("Background",y/10);
}