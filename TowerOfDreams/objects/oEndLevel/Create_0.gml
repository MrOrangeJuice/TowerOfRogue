/// @description Init

audio_play_sound(snd_LevelIntro1,5,false);
levelFinished = true;
gems = false;
gemNum = 0;
totalGemNum = oLevelInfo.totalGems;
damageNum = global.localDamage;
damageDisplay = false;
gemsEnded = false;
damage = false;
rank = false;
rankLetter = false;
continutePrompt = false;

// Gem alarm
alarm[0] = room_speed * 0.3;