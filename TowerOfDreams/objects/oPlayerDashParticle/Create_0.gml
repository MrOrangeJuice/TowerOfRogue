/// @description Init

particleSystem = part_system_create();

particleTypePlayerDashFade = part_type_create();
particleTypePlayerDashReverseFade = part_type_create();
particleTypePlayerJumpFade = part_type_create();
particleTypePlayerJumpReverseFade = part_type_create();

// Run
part_type_sprite(particleTypePlayerDashFade,sPlayerRunYellow,0,0,1);
part_type_size(particleTypePlayerDashFade,1,1,0,0);

part_type_life(particleTypePlayerDashFade,20,20);
part_type_alpha3(particleTypePlayerDashFade, 0.5, 0.3, 0.1);

// Run Reverse
part_type_sprite(particleTypePlayerDashReverseFade,sPlayerRunYellowLeft,0,0,1);
part_type_size(particleTypePlayerDashReverseFade,1,1,0,0);

part_type_life(particleTypePlayerDashReverseFade,20,20);
part_type_alpha3(particleTypePlayerDashReverseFade, 0.5, 0.3, 0.1);

// Jump
part_type_sprite(particleTypePlayerJumpFade,sPlayerJumpYellow,0,0,1);
part_type_size(particleTypePlayerJumpFade,1,1,0,0);

part_type_life(particleTypePlayerJumpFade,20,20);
part_type_alpha3(particleTypePlayerJumpFade, 0.5, 0.3, 0.1);

// Jump Reverse
part_type_sprite(particleTypePlayerJumpReverseFade,sPlayerJumpYellowLeft,0,0,1);
part_type_size(particleTypePlayerJumpReverseFade,1,1,0,0);

part_type_life(particleTypePlayerJumpReverseFade,20,20);
part_type_alpha3(particleTypePlayerJumpReverseFade, 0.5, 0.3, 0.1);