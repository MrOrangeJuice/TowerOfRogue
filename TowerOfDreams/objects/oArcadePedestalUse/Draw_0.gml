/// @description Draw cursor

draw_self();

draw_sprite(sCursorTopLeft,0,cursorTopLeftX,cursorTopLeftY);
draw_sprite(sCursorTopRight,0,cursorTopRightX,cursorTopRightY);
draw_sprite(sCursorBottomLeft,0,cursorBottomLeftX,cursorBottomLeftY);
draw_sprite(sCursorBottomRight,0,cursorBottomRightX,cursorBottomRightY);

draw_set_alpha(0.5);
draw_sprite(sLightUI,0,spawnX,spawnY);
draw_set_alpha(1.0);