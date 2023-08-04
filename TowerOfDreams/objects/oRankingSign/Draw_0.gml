/// @description Draw Rankings

draw_self();
draw_set_halign(fa_center);

draw_text(x+64,y+40,"Level Bests:");

draw_text(x+64,y+48,"Cannon Conundrum: " + string(global.best1_1));
draw_text(x+64,y+56,"Gravity Gauntlet: " + string(global.best1_2));
draw_text(x+64,y+64,"Swap Hop: " + string(global.best1_3));
draw_text(x+64,y+72,"Bumper Buster: " + string(global.best1_4));
draw_text(x+64,y+80,"On A Roll: " + string(global.best1_5));
draw_text(x+64,y+88,"Construction Calamity: " + string(global.best2_1));
draw_text(x+64,y+96,"Vertical Velocity: " + string(global.best2_2));
draw_text(x+64,y+104,"Block Party: " + string(global.best2_3));

draw_set_halign(fa_left);