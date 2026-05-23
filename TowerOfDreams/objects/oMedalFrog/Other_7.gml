/// @description End tongue animation

if(tongue)
{
	sprite_index = sMedalFrog;
	tongue = false;
	frogBusy = false;
}

if(sprite_index == sMedalFrogTalk)
{
	sprite_index = sMedalFrog;
}