/// @description Draw cursor

draw_self();

draw_sprite(sCursorTopLeft,0,cursorTopLeftX,cursorTopLeftY);
draw_sprite(sCursorTopRight,0,cursorTopRightX,cursorTopRightY);
draw_sprite(sCursorBottomLeft,0,cursorBottomLeftX,cursorBottomLeftY);
draw_sprite(sCursorBottomRight,0,cursorBottomRightX,cursorBottomRightY);

if(!selectionConfirmed) 
{
    draw_set_halign(fa_center);
    draw_set_color($6D454D);
    draw_text(spawnX + 5,spawnY - 24,itemNames[currentItem]);
    draw_text(spawnX + 3,spawnY - 24,itemNames[currentItem]);
    draw_text(spawnX + 4,spawnY - 23,itemNames[currentItem]);
    draw_text(spawnX + 4,spawnY - 25,itemNames[currentItem]);
    
    draw_set_color($B1D7F0);
    draw_text(spawnX + 4,spawnY - 24,itemNames[currentItem]);
    draw_set_alpha(0.5);
    
    draw_set_halign(fa_left);
}
    
if(currentItem != 1 || !selectionConfirmed)
{
    draw_sprite(object_get_sprite(unlockedItems[currentItem]),0,spawnX,spawnY);
}
else
{
    draw_sprite(object_get_sprite(unlockedItems[currentItem]),(1 + key_select),spawnX,spawnY);
}
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