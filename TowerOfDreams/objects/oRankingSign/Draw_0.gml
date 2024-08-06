/// @description Draw Rankings

draw_self();
draw_set_halign(fa_center);

draw_text(x+192,y+36,"LEVEL BESTS");
draw_text(x+192,y+44,"Overall Best: " + string(global.bestOverall));

draw_text(x+64,y+56,"Floor 1");
draw_text(x+64,y+64,"Cannon Conundrum: " + string(global.best1_1));
draw_text(x+64,y+72,"Gravity Gauntlet: " + string(global.best1_2));
draw_text(x+64,y+80,"Swap Hop: " + string(global.best1_3));
draw_text(x+64,y+88,"Bumper Buster: " + string(global.best1_4));
draw_text(x+64,y+96,"On A Roll: " + string(global.best1_5));
draw_text(x+64,y+104,"Shrooms of Doom: " + string(global.best1_6));

draw_text(x+192,y+56,"Floor 2");
draw_text(x+192,y+64,"Construction Calamity: " + string(global.best2_1));
draw_text(x+192,y+72,"Vertical Velocity: " + string(global.best2_2));
draw_text(x+192,y+80,"Block Party: " + string(global.best2_3));
draw_text(x+192,y+88,"Missile Mayhem: " + string(global.best2_4));
draw_text(x+192,y+96,"The Sawblade Level: " + string(global.best2_5));

draw_text(x+320,y+56,"Floor 3");
draw_text(x+320,y+64,"Cloudy Catastrophe: " + string(global.best3_1));
draw_text(x+320,y+72,"Dash Fruit Smoothie: " + string(global.best3_2));
draw_text(x+320,y+80,"Larry's Liftoff: " + string(global.best3_3));
draw_text(x+320,y+88,"Watch Your Step: " + string(global.best3_4));

draw_set_halign(fa_left);