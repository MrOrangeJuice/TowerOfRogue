/// @description Init

audio_play_sound(snd_Axe,5,false);
xSpeed = 1;
vsp = -2.5;
grv = 0.1;
dmgMultiplier = 0;
canHit = true;
particlesStarted = false;
particles = instance_create_layer(x,y,"Walls",oAxeParticle);

if(dir == -1)
{
	image_speed = -1;	
}