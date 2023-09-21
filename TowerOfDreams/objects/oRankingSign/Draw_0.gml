/// @description Draw Rankings

draw_self();
draw_set_halign(fa_center);

draw_text(x+128,y+36,"LEVEL BESTS");
draw_text(x+128,y+44,"Overall Best: " + string(global.bestOverall));

draw_text(x+64,y+52,"Floor 1");
draw_text(x+64,y+60,"Cannon Conundrum: " + string(global.best1_1));
draw_text(x+64,y+68,"Gravity Gauntlet: " + string(global.best1_2));
draw_text(x+64,y+76,"Swap Hop: " + string(global.best1_3));
draw_text(x+64,y+84,"Bumper Buster: " + string(global.best1_4));
draw_text(x+64,y+92,"On A Roll: " + string(global.best1_5));
draw_text(x+64,y+100,"Shrooms of Doom: " + string(global.best1_6));

draw_text(x+192,y+52,"Floor 2");
draw_text(x+192,y+60,"Construction Calamity: " + string(global.best2_1));
draw_text(x+192,y+68,"Vertical Velocity: " + string(global.best2_2));
draw_text(x+192,y+76,"Block Party: " + string(global.best2_3));
draw_text(x+192,y+84,"Missile Mayhem: " + string(global.best2_4));

draw_set_halign(fa_left);