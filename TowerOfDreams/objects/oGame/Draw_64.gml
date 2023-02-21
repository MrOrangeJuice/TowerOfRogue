/// @description Draw GUI

draw_set_font(fUI);

// Draw Pause Menu
if(global.paused)
{
	draw_sprite(sPauseMenu,pauseOption,80,40);
}