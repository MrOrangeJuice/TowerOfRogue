/// @description Take away sword for tutorial

if(room == rTutorial)
{
	global.sword = false;	
}
if(room == rTutorial2 || room == rTutorial)
{
	global.infiniteHealth = true;	
}
else
{
	global.infiniteHealth = false;	
}