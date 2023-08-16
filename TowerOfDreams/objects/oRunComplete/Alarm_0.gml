/// @description Play sound effect in time with letter appearing

if(lettersRemaining > 0) audio_play_sound(snd_LevelIntro2,5,false);
lettersRemaining--;
alarm[0] = room_speed * 0.2;