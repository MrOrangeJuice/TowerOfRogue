/// @description Init

enum state {
    Idle,
    Grow,
    Portal,
    AllTheWay,
    Shrink,
    Sleep
}

if(unlocked)
{
    reminoState = state.Idle;
}
else 
{
    reminoState = state.Sleep;
}
range = 16;

labelY = 0;
labelYTarget = 0;

sound1Played = false;
sound2Played = false;
sound3Played = false;
sound4Played = false;
sound5Played = false;

soundInfoPlayed = false;
soundInfoOutPlayed = false;