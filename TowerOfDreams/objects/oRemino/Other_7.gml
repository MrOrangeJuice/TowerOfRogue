/// @description Transition

if(reminoState == state.Grow)
{
    reminoState = state.Portal;
}

if(reminoState == state.Shrink)
{
    reminoState = state.Idle;
}

if(reminoState == state.AllTheWay)
{
    reminoState = state.Idle;
}

if(reminoState == state.Portal)
{
    if(!(place_meeting(x,y,oPlayer)))
    {
        reminoState = state.Shrink;
        image_index = 0;
    }
}