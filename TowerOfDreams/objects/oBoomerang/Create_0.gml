/// @description Init

audio_play_sound(snd_BoomerangThrow,5,false);
xSpeed = 2;
dmgMultiplier = 0;
canHit = true;
particlesStarted = false;
particles = instance_create_layer(x,y,"Walls",oBoomerangParticle);

if(dir == -1)
{
	image_speed = -1;	
}