/// @description Init

audio_play_sound(snd_LevelIntro1,5,false);
levelFinished = true;
gems = false;
time = false;
damage = false;
rank = false;
continutePrompt = false;

// Gem alarm
alarm[0] = room_speed * 0.3;

// Continue alarm
alarm[1] = room_speed * 0.5;