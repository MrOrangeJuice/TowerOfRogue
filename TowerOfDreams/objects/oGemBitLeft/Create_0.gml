/// @description Init

// Set Random Direction
direction = random_range(105,255);
speed = 4;

// Set gravity variables
vsp = -2.5;
grv = 0.15;

// Set despawn timer
alarm[0] = room_speed * 2;