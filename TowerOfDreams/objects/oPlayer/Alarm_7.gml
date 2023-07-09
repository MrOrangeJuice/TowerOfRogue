/// @description Spawn afterimages

if(chargeBounces == 2) 
{
	if(image_xscale > 0)
	{
		part_particles_create(oPlayerChargeParticle.particleSystem,x,y,oPlayerChargeParticle.particleTypePlayerFade,1);
	}
	else
	{
		part_particles_create(oPlayerChargeParticle.particleSystem,x,y,oPlayerChargeParticle.particleTypePlayerReverseFade,1);
	}
	alarm[7] = room_speed * 0.1;
}


