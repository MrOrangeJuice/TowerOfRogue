/// @description Init

event_inherited();

if(global.hardMode) elite = true;

if(elite)
{
	sprite_index = sBallPipeElite;
}
else 
{
	sprite_index = sBallPipe;
}