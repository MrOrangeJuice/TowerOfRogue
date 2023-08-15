/// @description Draw Rankings

draw_self();
draw_set_halign(fa_center);

draw_text(x+64,y+36,"Level Bests:");

draw_text(x+64,y+44,"Cannon Conundrum: " + string(global.best1_1));
draw_text(x+64,y+52,"Gravity Gauntlet: " + string(global.best1_2));
draw_text(x+64,y+60,"Swap Hop: " + string(global.best1_3));
draw_text(x+64,y+68,"Bumper Buster: " + string(global.best1_4));
draw_text(x+64,y+76,"On A Roll: " + string(global.best1_5));
draw_text(x+64,y+84,"Construction Calamity: " + string(global.best2_1));
draw_text(x+64,y+92,"Vertical Velocity: " + string(global.best2_2));
draw_text(x+64,y+100,"Block Party: " + string(global.best2_3));
draw_text(x+64,y+112,"Run Best: " + string(global.bestOverall));

draw_set_halign(fa_left);