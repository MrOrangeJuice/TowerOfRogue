/// @description Draw arrow

draw_self();

if(colliding) draw_sprite(sArrow,0,x+28,y+73);
if(win) draw_sprite(sArcadeResult,0,x+16,y+18);
if(lose) draw_sprite(sArcadeResultBad,0,x+16,y+18);