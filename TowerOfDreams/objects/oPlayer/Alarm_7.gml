/// @description Spawn afterimages

if(chargeBounces == 2) 
{
	part_particles_create(oPlayerChargeParticle.particleSystem,x,y,oPlayerChargeParticle.particleTypePlayerFade,1);
	alarm[7] = room_speed * 0.1;
}


