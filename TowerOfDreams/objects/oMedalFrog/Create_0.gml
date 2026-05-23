/// @description Init

tongue = false;
item = 0;

// Dialogue stuff
colliding = false;
richColliding = false;
frogBusy = false;
yAccel = 0.02;
vsp = 0;
yOffset = 0;

analogUpPrev = false;
analogUpPrevD = false;

playerHasMedals = false;
if(global.timeMedals > global.medalsFedToFrog) playerHasMedals = true;

phrases = ["I love medals!","Medals are tasty!","Feed me medals!","I crave medals!"];
prevPhrase = "";