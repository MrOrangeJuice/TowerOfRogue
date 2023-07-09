/// @description Init

particleSystem = part_system_create();

particleTypePlayerFade = part_type_create();
particleTypePlayerReverseFade = part_type_create();

part_type_sprite(particleTypePlayerFade,sPlayerJumpGreen,0,0,1);
part_type_size(particleTypePlayerFade,1,1,0,0);

part_type_life(particleTypePlayerFade,20,20);
part_type_alpha3(particleTypePlayerFade, 0.5, 0.3, 0.1);

part_type_sprite(particleTypePlayerReverseFade,sPlayerJumpGreenLeft,0,0,1);
part_type_size(particleTypePlayerReverseFade,1,1,0,0);

part_type_life(particleTypePlayerReverseFade,20,20);
part_type_alpha3(particleTypePlayerReverseFade, 0.5, 0.3, 0.1);