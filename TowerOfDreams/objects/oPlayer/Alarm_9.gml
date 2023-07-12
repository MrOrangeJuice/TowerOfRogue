/// @description Spawn Dash Afterimages

if(dashing)
{
	if(airborne)
	{
		if(image_xscale > 0)
		{
			part_particles_create(oPlayerDashParticle.particleSystem,x,y,oPlayerDashParticle.particleTypePlayerDashFade,1);
		}
		else
		{
			part_particles_create(oPlayerDashParticle.particleSystem,x,y,oPlayerDashParticle.particleTypePlayerDashReverseFade,1);
		}
		alarm[9] = room_speed * 0.05;
	}
	else
	{
		if(image_xscale > 0)
		{
			part_particles_create(oPlayerDashParticle.particleSystem,x,y,oPlayerDashParticle.particleTypePlayerJumpFade,1);
		}
		else
		{
			part_particles_create(oPlayerDashParticle.particleSystem,x,y,oPlayerDashParticle.particleTypePlayerJumpReverseFade,1);
		}
		alarm[9] = room_speed * 0.05;
	}
}