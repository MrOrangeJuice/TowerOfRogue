/// @description Draw cursor

draw_self();

draw_sprite(sCursorTopLeft,0,cursorTopLeftX,cursorTopLeftY);
draw_sprite(sCursorTopRight,0,cursorTopRightX,cursorTopRightY);
draw_sprite(sCursorBottomLeft,0,cursorBottomLeftX,cursorBottomLeftY);
draw_sprite(sCursorBottomRight,0,cursorBottomRightX,cursorBottomRightY);

if(!selectionConfirmed) draw_set_alpha(0.5);
draw_sprite(object_get_sprite(global.itemObjects[currentItem]),0,spawnX,spawnY);
draw_set_alpha(1.0);