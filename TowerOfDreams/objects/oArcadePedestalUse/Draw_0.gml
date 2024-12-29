/// @description Draw cursor

draw_self();

draw_sprite(sCursorTopLeft,0,cursorTopLeftX,cursorTopLeftY);
draw_sprite(sCursorTopRight,0,cursorTopRightX,cursorTopRightY);
draw_sprite(sCursorBottomLeft,0,cursorBottomLeftX,cursorBottomLeftY);
draw_sprite(sCursorBottomRight,0,cursorBottomRightX,cursorBottomRightY);

if(!selectionConfirmed) draw_set_alpha(0.5);
draw_sprite(object_get_sprite(unlockedItems[currentItem]),0,spawnX,spawnY);
// Draw selection previews
if(!selectionConfirmed)
{
	if(currentItem >= array_length(unlockedItems) - 1)
	{
		draw_sprite(object_get_sprite(unlockedItems[currentItem - 1]),0,spawnX-16,spawnY);
		draw_sprite(object_get_sprite(unlockedItems[0]),0,spawnX+16,spawnY);
	}
	else if(currentItem <= 0)
	{
		draw_sprite(object_get_sprite(unlockedItems[array_length(unlockedItems) - 1]),0,spawnX-16,spawnY);
		draw_sprite(object_get_sprite(unlockedItems[currentItem + 1]),0,spawnX+16,spawnY);
	}
	else
	{
		draw_sprite(object_get_sprite(unlockedItems[currentItem - 1]),0,spawnX-16,spawnY);
		draw_sprite(object_get_sprite(unlockedItems[currentItem + 1]),0,spawnX+16,spawnY);
	}
	
	if(displayArrows)
	{
		draw_sprite(sArrowLeft,0,spawnX-28,spawnY+1);
		draw_sprite(sArrowRight,0,spawnX+28,spawnY+1);
	}
}
draw_set_alpha(1.0);