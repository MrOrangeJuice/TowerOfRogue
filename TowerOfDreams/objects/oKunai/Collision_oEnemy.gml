/// @description Hit enemy

other.flash = 5;
other.hp -= 0.25;
ScreenShake(1,5);
audio_play_sound(snd_Hit,5,false);
instance_destroy();