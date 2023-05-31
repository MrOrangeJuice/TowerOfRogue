/// @description Init

// Set Random Direction
direction = random_range(0, 360);
speed = 0.5;

// Set gravity variables
vsp = -2;
grv = 0.15;

// Set despawn timer
alarm[0] = room_speed * 2;