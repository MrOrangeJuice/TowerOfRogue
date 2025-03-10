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