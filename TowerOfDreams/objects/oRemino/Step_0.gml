/// @description Check for state change

if(reminoState == state.Idle)
{
    if(instance_exists(oPlayer))
    {
        if(place_meeting(x,y,oPlayer))
        {
            reminoState = state.Grow;
            image_index = 0;
        }
    }
}

if(reminoState == state.Grow)
{
    if(!(place_meeting(x,y,oPlayer)) && image_index <= 11)
    {
        reminoState = state.AllTheWay;
    }
}

// Animate
switch(reminoState)
{
    case state.Idle:
        sprite_index = sMemoryGremlin;
        break;
    case state.Grow:
        sprite_index = sMemoryGremlinGrow;
        break;
    case state.Portal:
        sprite_index = sMemoryGremlinPortal;
        break;
    case state.AllTheWay:
        sprite_index = sMemoryGremlinAllTheWay;
        break;
    case state.Shrink:
        sprite_index = sMemoryGremlinShrink;
        break;
    case state.Sleep:
        sprite_index = sMemoryGremlinSleep;
        break;
}