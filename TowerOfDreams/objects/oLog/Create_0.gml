/// @description Init

// Set Random Direction
direction = random_range(0, 360);
speed = 1;

// Set gravity variables
vsp = -3;
grv = 0.15;

// Set despawn timer
alarm[0] = room_speed * 2;