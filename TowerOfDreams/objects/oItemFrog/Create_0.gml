/// @description Init

tongue = false;
item = 0;

// Dialogue stuff
colliding = false;
yAccel = 0.02;
vsp = 0;
yOffset = 0;

playerHasNoItem = false;
if(global.item == -1) playerHasNoItem = true;

phrases = ["I love active items!","Active items are tasty!","Feed me active items!","I crave active items!"];
prevPhrase = "";