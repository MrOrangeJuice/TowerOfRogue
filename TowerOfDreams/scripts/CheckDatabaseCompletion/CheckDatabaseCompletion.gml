// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckDatabaseCompletion()
{
    somethingNotUnlocked = false;
    
    for(i = 0; i < array_length(global.itemsFound); i++)
    {
        if(!global.itemsFound[i]) somethingNotUnlocked = true;
    }
    
    for(j = 0; j < array_length(global.enemiesFound); j++)
    {
        if(!global.enemiesFound[j]) somethingNotUnlocked = true;
    }
    
    if(!somethingNotUnlocked)
    {
        if(!steam_get_achievement("ALLDATABASE"))
        {
            steam_set_achievement("ALLDATABASE");
        }
    }
}