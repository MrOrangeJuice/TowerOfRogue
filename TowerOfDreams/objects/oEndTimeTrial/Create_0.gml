/// @description Init

global.timeIncrement = false;
audio_play_sound(snd_LevelIntro1,5,false);
audio_play_sound(msc_BonusItem,5,true);
levelFinished = true;
time = false;
timeNum = global.time + 1000;
timeEnded = false;
perfectTime = false;
silverTime = false;

continutePrompt = false;
interestPrompt = false;

levelProgressed = false;

Save();

// Time alarm
alarm[0] = room_speed * 0.3;