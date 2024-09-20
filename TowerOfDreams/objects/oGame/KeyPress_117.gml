/// @description Cheat up tower

if(global.debug)
{
	if(global.inARun)
	{
		audio_play_sound(snd_SwordGet,5,false);
		// Reset side room
		global.sideRoom = rTitle;
		global.shopRoom = rTitle;
		global.sideChestOpened = false;
		global.pipeSpawned = false;
		global.shopSpawned = false;
		global.pipeY = 0;
		global.shopY = 0;
		global.levelCount++;
		PickNextLevel();
	}
}