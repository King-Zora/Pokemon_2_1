//Sorry about the huge function :(
void createWalls() {
  wall[0] = new Wall(-1000, 1, 1, 1);  
  wall[1] = new Wall(-1000, 1, 1, 1);  
  wall[2] = new Wall(-1000, 1, 1, 1);  
  wall[3] = new Wall(-1000, 1, 1, 1);  
  wall[4] = new Wall(-1000, 1, 1, 1);  
  wall[5] = new Wall(-1000, 1, 1, 1);  
  wall[6] = new Wall(-1000, 1, 1, 1); 
  wall[7] = new Wall(-1000, 1, 1, 1); 
  wall[8] = new Wall(-1000, 1, 1, 1);  
  wall[9] = new Wall(-1000, 1, 1, 1); 
  wall[10] = new Wall(-1000, 1, 1, 1);
  wall[11] = new Wall(-1000, 1, 1, 1);  
  wall[12] = new Wall(-1000, 1, 1, 1);  
  wall[13] = new Wall(-1000, 1, 1, 1);  
  wall[14] = new Wall(-1000, 1, 1, 1); 
  wall[15] = new Wall(-1000, 1, 1, 1);  
  wall[16] = new Wall(-1000, 1, 1, 1);  
  wall[17] = new Wall(-1000, 1, 1, 1);  
  wall[18] = new Wall(-1000, 1, 1, 1);  
  wall[19] = new Wall(-1000, 1, 1, 1);  
  wall[20] = new Wall(-1000, 1, 1, 1);

  npcs[0] = new NPC(-5, -1, 1, 1);
  npcs[1] = new NPC(-5, -1, 1, 1);
  npcs[2] = new NPC(-5, -1, 1, 1);
  npcs[3] = new NPC(-5, -1, 1, 1);

  fences[0] = new Fence(4, -13, 2, 1); //L01 Left
  fences[1] = new Fence(10, -13, 8, 1); //L01 Right
  fences[2] = new Fence(16, -17, 2, 1); //L02 Right
  fences[3] = new Fence(4, -21, 1, 1); //L03 Left
  fences[4] = new Fence(6, -21, 3, 1); //L03 Middle
  fences[5] = new Fence(10, -21, 8, 1); //L03 Right
  fences[6] = new Fence(6, -27, 4, 1); //L04 Middle
  fences[7] = new Fence(4, -31, 5, 1); //L05 Left
  fences[8] = new Fence(4, -35, 10, 1); //L06 Left

  grass[0] = new Grass (10, -8, 2, 6); 
  grass[1] = new Grass (4, -10, 4, 2); 
  grass[2] = new Grass (6, -12, 4, 2); 
  grass[3] = new Grass (12, -10, 4, 2); 
  grass[4] = new Grass (14, -12, 4, 2); 
  grass[5] = new Grass (12, -18, 4, 4); 
  grass[6] = new Grass (14, -28, 4, 4); 
  grass[7] = new Grass (10, -34, 8, 4); 
  if (room == 0) { //Ash's Room
    npcs[0] = new NPC(4, 3, 1, 1); //SNES

    //Create all the walls
    wall[0] = new Wall(1, -1, 3, 1);  //Desk
    wall[1] = new Wall(4, 2, 1, 1);  //TV
    wall[2] = new Wall(1, 4, 1, 2);  //Bed
    wall[3] = new Wall(7, 4, 1, 2);  //Tree
    wall[4] = new Wall(1, 6, 8, 1);  //Bot
    wall[5] = new Wall(0, -2, 1, 8);  //Left
    wall[6] = new Wall(1, -2, 9, 1); //Top
    wall[7] = new Wall(9, -2, 1, 8); // Right

    stairs = new Warp(8, -1, 1, 1);
  } 
  if (room == 1) { //Ash's House Lower Floor 
    npcs[0] = new NPC(4, -1, 1, 1); //TV
    npcs[1] = new NPC(1, -1, 2, 1); //Shelves
    npcs[2] = new NPC(6, 2, 1, 1); //Mom

    wall[0] = new Wall(4, -1, 1, 1);  //TV
    wall[1] = new Wall(4, 2, 2, 2);  //Table
    wall[2] = new Wall(1, -1, 2, 1);  //Shelves
    wall[3] = new Wall(5, 6, 4, 1);  //Bot Right
    wall[4] = new Wall(1, 6, 2, 1);  //Bot Left
    wall[5] = new Wall(0, -2, 1, 8);  //Left
    wall[6] = new Wall(1, -2, 9, 1); //Top
    wall[7] = new Wall(9, -2, 1, 8); // Right
    wall[8] = new Wall(3, 7, 2, 1);  //Block Door (Room 2)
    if (yCam > -160) {
      stairs = new Warp(8, -1, 1, 1);
    } else {
      stairs = new Warp(3, 6, 2, 1);
    }
  } 
  if (room == 2) { //Outside
    if (xCam >= -224) {
      stairs = new Warp(5, 1, 1, 1); //Ash's House
    } else {
      if (yCam >= -192) {
        stairs = new Warp(13, 1, 1, 1); //Blue's House
      } else {
        stairs = new Warp(12, 7, 1, 1); //Lab
      }
    }
    if (yCam <= 1280) { //Route 01
      npcs[0] = new NPC(9, -13, 1, 1); //Route 01 Sign

      wall[0] = new Wall(18, -17, 1, 1);  //Fence L02 Right //
      wall[1] = new Wall(4, -17, 8, 1);  //Trees L02 Left //
      wall[2] = new Wall(3, -13, 1, 1);  //Fence L01 Left //
      wall[3] = new Wall(9, -13, 1, 1);  //Fence L01 Right //
      wall[4] = new Wall(3, -39, 1, 31);  //Main Left //
      wall[5] = new Wall(3, -8, 7, 1);  //Bot Left //
      wall[6] = new Wall(12, -8, 7, 1); //Bot Right //
      wall[7] = new Wall(18, -39, 1, 31); //Main Right //
      wall[8] = new Wall(9, -8, 1, 6);  //Top Left Grass Vertical //
      wall[9] = new Wall(12, -8, 1, 6);  //Top Right Grass Vertical (Room 3) //
      wall[10] = new Wall(3, -21, 1, 1); //Fence L03 Left //
      wall[11] = new Wall(3, -21, 1, 1);  //Fence L03 Middle //
      wall[12] = new Wall(10, -27, 4, 1);  //Fence L03 Right //
      wall[13] = new Wall(4, -27, 2, 1);  //Trees L04 Left //

      wall[14] = new Wall(3, -31, 1, 1); //Fence L05 Left //
      wall[15] = new Wall(3, -35, 1, 1);  //Fence L06 Left //
      wall[16] = new Wall(9, -36, 1, 6);  //Trees Vertical //
      wall[17] = new Wall(4, -39, 6, 1);  //Top Left //
      wall[18] = new Wall(12, -39, 6, 1);  //Top Right //
      wall[19] = new Wall(9, -42, 1, 3);  //Top Left Vertical //
      wall[20] = new Wall(12, -42, 1, 3);  //Top Right Vertical //
    } else { //Viridian City
      if (yCam < 2144) {
        stairs = new Warp(11, -66, 1, 1); //House 02
      }
      if (yCam < 1912) {
        stairs = new Warp(11, -60, 1, 1); //House 01
      }
      if (yCam < 1792) {
        stairs = new Warp(19, -56, 1, 1); //Mart
      }
      if (yCam < 1632) {
        stairs = new Warp(13, -50, 1, 1); //Pokemon Center
      }
      if (yCam < 1728) { //Bot
        npcs[0] = new NPC(11, -46, 1, 1); //Viridian City Sign

        wall[0] = new Wall(16, -17, 2, 1);  //Fence L02 Right 
        wall[1] = new Wall(-10, -57, 3, 1);  //Top of Left Bot Hill //
        wall[2] = new Wall(20, -56, 2, 1);  //Bot Right Mart //
        wall[3] = new Wall(18, -56, 1, 1);  //Bot Left Mart//
        wall[4] = new Wall(-7, -57, 1, 14);  //Main Left // 
        wall[5] = new Wall(18, -59, 4, 3);  //Top Mart // 
        wall[6] = new Wall(-6, -54, 4, 1); //Bushes Full Left Top Left of Lake // 
        wall[7] = new Wall(26, -74, 1, 30); //Main Right //
        wall[8] = new Wall(-2, -53, 1, 1);  //Tree Top Left of Lake //
        wall[9] = new Wall(-2, -52, 2, 1);  //Bush Top Left of Lake // 
        wall[10] = new Wall(14, -50, 2, 1); //Bot Right Pokemon Center //
        wall[11] = new Wall(12, -50, 1, 1);  //Bot Left pokemon Center //
        wall[12] = new Wall(12, -53, 4, 3);  //Pokemon Center Top //
        wall[13] = new Wall(10, -70, 16, 1);  //Barrier L03 Right // 

        wall[15] = new Wall(-2, -51, 6, 4);  //Lake //

        wall[17] = new Wall(-7, -44, 16, 1);  //Top Left //
        wall[18] = new Wall(12, -44, 15, 1);  //Bot Right //
        wall[19] = new Wall(9, -44, 1, 3);  //Top Left Vertical //
        wall[20] = new Wall(12, -44, 1, 3);  //Top Right Vertical //

        fences[0] = new Fence(10, -48, 16, 1); //L01 Right
        fences[1] = new Fence(6, -48, 3, 1); //L01 Middle
        fences[2] = new Fence(-7, -48, 12, 1); //L02 Right
      } else {
        if (yCam < 1984) { //Top
          npcs[0] = new NPC(7, -58, 1, 1); //Random Sign

          wall[0] = new Wall(10, -58, 4, 1);  //Fence L03 Center //
          wall[1] = new Wall(-10, -57, 3, 1);  //Top of Left Bot Hill //
          wall[2] = new Wall(20, -56, 2, 1);  //Bot Right Mart //
          wall[3] = new Wall(18, -56, 1, 1);  //Bot Left Mart //
          wall[4] = new Wall(-7, -57, 1, 14);  //Main Left //  
          wall[5] = new Wall(18, -59, 4, 3);  //Top Mart // 
          wall[6] = new Wall(10, -69, 1, 2); //Barrier Top of Top House //
          wall[7] = new Wall(26, -74, 1, 30); //Main Right //
          wall[8] = new Wall(-2, -59, 8, 1);  //Bot Samall Forest //
          wall[9] = new Wall(-3, -69, 10, 10);  //Small Foest //
          wall[10] = new Wall(-2, -70, 8, 1); //Small Forest Top //
          wall[11] = new Wall(-10, -75, 6, 14);  //Top Left Hill //  
          wall[12] = new Wall(-4, -75, 11, 4);  //Trees furthest top Left //
          wall[13] = new Wall(10, -75, 16, 2);  //Trees furthest Top Right //
          wall[14] = new Wall(10, -73, 4, 2); //Trees Furthest top Right lower //
          wall[15] = new Wall(10, -61, 4, 1);  //House 01 Top //
          wall[16] = new Wall(10, -60, 1, 1);  //House 01 Bot Left //
          wall[17] = new Wall(12, -60, 2, 1);  //House 01 Bot Right //
          wall[18] = new Wall(10, -62, 16, 1);  //Fence L04 Right //
          wall[19] = new Wall(10, -67, 4, 1);  //Top House Left of Bot Gym Fence // 
          wall[20] = new Wall(10, -66, 1, 1);  //Bot Left House Left of Bot Gym Fence //

          fences[3] = new Fence(14, -66, 12, 1); //L03 Right
        } else {
          if (yCam <= 2336) { //Viridian City Top
            npcs[0] = new NPC(9, -74, 1, 1); //End of the World Sign

            wall[0] = new Wall(10, -58, 4, 1);  //Fence L03 Center //
            wall[1] = new Wall(-10, -57, 3, 1);  //Top of Left Bot Hill //
            wall[2] = new Wall(18, -71, 6, 4);  //Bot Right Mart //
            wall[3] = new Wall(12, -66, 2, 1);  //Bot Right Top House //
            wall[4] = new Wall(-7, -57, 1, 14);  //Main Left //  
            wall[5] = new Wall(18, -59, 4, 3);  //Top Mart // 
            wall[6] = new Wall(10, -69, 1, 2); //Barrier Top of Top House //
            wall[7] = new Wall(26, -74, 1, 30); //Main Right //
            wall[8] = new Wall(-2, -59, 8, 1);  //Bot Samall Forest //
            wall[9] = new Wall(-3, -69, 10, 10);  //Small Foest //
            wall[10] = new Wall(-2, -70, 8, 1); //Small Forest Top //
            wall[11] = new Wall(-10, -75, 6, 14);  //Top Left Hill //  
            wall[12] = new Wall(-4, -75, 11, 4);  //Trees furthest top Left //
            wall[13] = new Wall(10, -75, 16, 2);  //Trees furthest Top Right //

            wall[14] = new Wall(10, -73, 4, 2); //Trees Furthest top Right lower //
            wall[15] = new Wall(10, -61, 4, 1);  //House 01 Top //
            wall[16] = new Wall(10, -60, 1, 1);  //House 01 Bot Left //
            wall[17] = new Wall(12, -60, 2, 1);  //House 01 Bot Right //
            wall[18] = new Wall(10, -62, 16, 1);  //Fence L04 Right //
            wall[19] = new Wall(10, -67, 4, 1);  //Top House Left of Bot Gym Fence // 
            wall[20] = new Wall(10, -66, 1, 1);  //Bot Left House Left of Bot Gym Fence //

            fences[3] = new Fence(14, -66, 12, 1); //L03 Right
          } else { //Route 03
            stairs = new Warp(3, -104, 1, 1); //Trans Room

            grass[0] = new Grass (4, -99, 6, 4); 

            npcs[0] = new NPC(5, -82, 1, 1); //End of the World Sign

            fences[0] = new Fence(0, -100, 8, 1); //L02 Left
            fences[1] = new Fence(2, -86, 5, 1); //L01 Middle
            fences[2] = new Fence(8, -86, 4, 1); //L01 Right

            wall[0] = new Wall(0, -77, 7, 2);  //Trees Bot Left //
            wall[1] = new Wall(0, -87, 2, 10);  //Trees Bot Left Side //
            wall[2] = new Wall(-1, -147, 1, 60);  //Main Left //
            wall[3] = new Wall(10, -78, 3, 3);  //Bot Right Top House //
            wall[4] = new Wall(12, -95, 1, 17);  //Main Right Bot //  
            wall[5] = new Wall(11, -104, 1, 9);  //Main Right Top // 
            wall[6] = new Wall(0, -104, 3, 1); //Top Left of House //
            wall[7] = new Wall(4, -104, 8, 1); //Top Right of House //
            wall[8] = new Wall(3, -105, 1, 1);  //Block Door //
            wall[9] = new Wall(6, -94, 6, 4);  //Small Forest //
            wall[10] = new Wall(5, -93, 1, 2); //Two Trees Left of Forest //
          }
        }
      }
    }
    if (yCam <= 128) { //Pallet Town
      npcs[0] = new NPC(3, 1, 1, 1); //Red Pannel
      npcs[1] = new NPC(11, 1, 1, 1); //Blue Pannel
      npcs[2] = new NPC(7, 5, 1, 1); //Pallet Town Sign
      npcs[3] = new NPC(13, 9, 1, 1); //Lab Sign

      wall[0] = new Wall(2, 14, 2, 1);  //Bot Left of Lake
      wall[1] = new Wall(4, 10, 4, 4);  //Lake
      wall[2] = new Wall(8, 13, 12, 1);  //Bot Right of Lake
      wall[3] = new Wall(1, 13, 1, 1);  //Bot Corner Left
      wall[4] = new Wall(0, -3, 1, 17);  //Main Left
      wall[5] = new Wall(1, -3, 9, 1);  //Top Left of Grass
      wall[6] = new Wall(12, -3, 8, 1); //Top Right of Grass
      wall[7] = new Wall(19, -2, 1, 16); //Main Right
      wall[8] = new Wall(9, -6, 1, 3);  //Top Left Grass Vertical
      wall[9] = new Wall(12, -6, 1, 3);  //Top Right Grass Vertical (Room 3)
      wall[10] = new Wall(4, -1, 4, 2); //Top House Red (Room 3)
      wall[11] = new Wall(3, 1, 2, 1);  //Pannel Red (Room 3)
      wall[12] = new Wall(6, 1, 2, 1);  //Right Bot Corner House Red (Room 3)
      wall[13] = new Wall(4, 5, 4, 1);  //Fence 01 (Room 3)

      wall[14] = new Wall(12, -1, 4, 2); //Top House Blue (Room 3)
      wall[15] = new Wall(11, 1, 2, 1);  //Pannel Blue (Room 3)
      wall[16] = new Wall(14, 1, 2, 1);  //Right Bot Corner House Blue (Room 3)
      wall[17] = new Wall(10, 4, 6, 3);  //Lab Top (Room 3)
      wall[18] = new Wall(10, 7, 2, 1);  //Lab Bot Left (Room 3)
      wall[19] = new Wall(13, 7, 3, 1);  //Lab Bot Right (Room 3)
      wall[20] = new Wall(10, 9, 6, 1);  //Fence 02 (Room 3)
    }
  } 
  if (room == 3) { //Blue's House
    npcs[0] = new NPC(4, -5, 1, 1); //Shelves Right
    npcs[1] = new NPC(-3, -5, 2, 1); //Shelves Left
    npcs[2] = new NPC(-1, -2, 1, 1); //Blue's Sis

    wall[0] = new Wall(4, -5, 1, 1);  //TV
    wall[1] = new Wall(0, -3, 2, 2);  //Table
    wall[2] = new Wall(-3, -5, 2, 1);  //Shelves
    wall[3] = new Wall(1, 2, 5, 1);  //Bot Right
    wall[4] = new Wall(-3, 2, 2, 1);  //Bot Left
    wall[5] = new Wall(-4, -6, 1, 8);  //Left
    wall[6] = new Wall(-3, -6, 9, 1); //Top
    wall[7] = new Wall(5, -6, 1, 8); // Right
    wall[8] = new Wall(-1, 3, 2, 1);  //Block Door (Room 2)

    wall[15] = new Wall(4, 0, 1, 2);  //Tree Right 
    wall[16] = new Wall(-3, 0, 1, 2);  //Tree Left 

    stairs = new Warp(-1, 2, 2, 1); //Door
  } 
  if (room == 4) { //Lab
    npcs[0] = new NPC(-3, 0, 4, 2); //Shelves Mid Left
    npcs[1] = new NPC(3, 0, 4, 2); //Shelves Mid Right
    npcs[2] = new NPC(3, -5, 4, 1); //Shelves Top Right
    npcs[3] = new NPC(1, -4, 1, 1); //Prof Oak

    wall[0] = new Wall(3, -5, 4, 1);  //TV
    wall[1] = new Wall(3, -3, 3, 1);  //Table //
    wall[2] = new Wall(-3, -5, 4, 1);  //Shelves
    wall[3] = new Wall(3, 6, 4, 1);  //Bot Right //
    wall[4] = new Wall(-3, 6, 4, 1);  //Bot Left //
    wall[5] = new Wall(-4, -6, 1, 12);  //Left //
    wall[6] = new Wall(-3, -6, 10, 1); //Top
    wall[7] = new Wall(7, -6, 1, 12); // Right //
    wall[8] = new Wall(1, 7, 2, 1);  //Block Door (Room 2) //

    stairs = new Warp(1, 6, 2, 1); //Door
  }
  if (room == 5) { //Pokemon Center
    npcs[0] = new NPC(0, -5, 1, 2); //Nurse
    npcs[1] = new NPC(-3, -2, 1, 1); //Sleep Guy

    grass[0] = new Grass (12, -8, 2, 6); //Move grass out of the way

    stairs = new Warp(0, 2, 2, 1); //Door


    wall[0] = new Wall(11, -6, 1, 8);  //Right Wall //
    wall[1] = new Wall(0, 3, 2, 1);  //Bot door block //
    wall[2] = new Wall(2, 2, 9, 1);  //Bot Right //
    wall[3] = new Wall(-3, 2, 3, 1);  //Bot Left //
    wall[4] = new Wall(-4, -6, 1, 8);  //Left Wall // 
    wall[5] = new Wall(-3, -6, 14, 3);  //Top // 
    wall[6] = new Wall(-3, -2, 1, 2); //Couch man // 
    wall[7] = new Wall(-3, 0, 2, 2); //Trees Left //
    wall[8] = new Wall(3, 0, 2, 2);  //Trees Middle //
    wall[9] = new Wall(9, 0, 2, 2);  //Trees Right // 
    wall[10] = new Wall(10, -3, 1, 1); //Computer //
    wall[11] = new Wall(12, -50, 1, 1);  //Bot Left pokemon Center //
    wall[12] = new Wall(12, -53, 4, 3);  //Pokemon Center Top //
    wall[13] = new Wall(10, -70, 16, 1);  //Barrier L03 Right // 

    wall[15] = new Wall(-2, -51, 6, 4);  //Lake //

    wall[17] = new Wall(-7, -44, 16, 1);  //Top Left //
    wall[18] = new Wall(12, -44, 15, 1);  //Bot Right //
    wall[19] = new Wall(9, -44, 1, 3);  //Top Left Vertical //
    wall[20] = new Wall(12, -44, 1, 3);  //Top Right Vertical //
  }
  if (room == 6) { //Mart
    npcs[0] = new NPC(-3, -1, 2, 1); //Salesman

    stairs = new Warp(0, 2, 2, 1); //Door

    wall[0] = new Wall(5, -6, 1, 8);  //Right Wall //
    wall[1] = new Wall(0, 3, 2, 1);  //Bot door block //
    wall[2] = new Wall(2, 2, 9, 1);  //Bot Right //
    wall[3] = new Wall(-3, 2, 3, 1);  //Bot Left //
    wall[4] = new Wall(-4, -6, 1, 8);  //Left Wall // 
    wall[5] = new Wall(-3, -6, 14, 2);  //Top // 
    wall[6] = new Wall(-3, -2, 1, 2); //Couch man // 
    wall[7] = new Wall(-3, -3, 2, 4); //Counter //
    wall[8] = new Wall(1, -3, 4, 2);  //Middle Shelves //
    wall[9] = new Wall(9, 0, 2, 2);  //Trees Right // 
    wall[10] = new Wall(10, -3, 1, 1); //Computer //
    wall[11] = new Wall(12, -50, 1, 1);  //Bot Left pokemon Center //
    wall[12] = new Wall(12, -53, 4, 3);  //Pokemon Center Top //
    wall[13] = new Wall(10, -70, 16, 1);  //Barrier L03 Right // 

    wall[15] = new Wall(-2, -51, 6, 4);  //Lake //

    wall[17] = new Wall(-7, -44, 16, 1);  //Top Left //
    wall[18] = new Wall(12, -44, 15, 1);  //Bot Right //
    wall[19] = new Wall(9, -44, 1, 3);  //Top Left Vertical //
    wall[20] = new Wall(12, -44, 1, 3);  //Top Right Vertical //
  }
  if (room == 10) {
    if (yCam <= 0) {
      stairs = new Warp(1, 2, 2, 1); //Route 03
    } else {
      stairs = new Warp(2, -6, 1, 1); //Viridian Forest
    }

    wall[0] = new Wall(7, -6, 1, 8);  //Right Wall //
    wall[1] = new Wall(1, 3, 2, 1);  //Bot door block //
    wall[2] = new Wall(3, 2, 5, 1);  //Bot Right //
    wall[3] = new Wall(-4, 2, 5, 1);  //Bot Left //
    wall[4] = new Wall(-4, -6, 1, 8);  //Left Wall // 
    wall[5] = new Wall(-3, -6, 5, 1);  //Top Left // 
    wall[6] = new Wall(3, -6, 4, 1); //Top Right // 
    wall[7] = new Wall(-3, -4, 1, 6); //Trees Left //
    wall[8] = new Wall(6, -4, 1, 6);  //Trees Right //
    wall[9] = new Wall(5, -4, 1, 2);  //Table Top Right // 
    wall[10] = new Wall(3, -4, 1, 2); //Table Top Left //
    wall[11] = new Wall(5, -1, 1, 2);  //Table Bot Right //
    wall[12] = new Wall(3, -1, 1, 2);  //Table Bot Left //
    wall[13] = new Wall(2, -7, 1, 1);  //Block Door Top //
  }
  if (room == 11) { //Viridian Forest
    stairs = new Warp(12, 40, 4, 1); //Trans Forest Room

    fences[0] = new Fence(0, -6, 30, 1); //Top //
    
    if (yCam <= -512) {
      npcs[0] = new NPC(15, 39, 1, 1);
    } else {
       npcs[0] = new NPC(-1, -5, 1, 1);
    }
    npcs[1] = new NPC(13, 26, 1, 1);
    npcs[2] = new NPC(23, 11, 1, 1);
    npcs[3] = new NPC(1, 18, 1, 1);

    if (yCam <= -960) { //Bot
      grass[0] = new Grass (5, 34, 8, 2);  //Lots of grass //
      grass[1] = new Grass (15, 34, 8, 2); //Lots of grass //
      grass[2] = new Grass (-2, 34, 5, 4); //Grass Bot Left //
      grass[3] = new Grass (25, 34, 5, 4); //Grass Bot Right //
      grass[4] = new Grass (5, 28, 1, 6); //Lots of grass //
      grass[5] = new Grass (12, 28, 1, 6); //Lots of grass //
      grass[6] = new Grass (15, 28, 1, 6); //Lots of grass //
      grass[7] = new Grass (22, 28, 1, 6); //Lots of grass //
    } else { 
      if (yCam <= -512) { //Mid
        grass[0] = new Grass (-2, 24, 8, 2);  //Lots of grass //
        grass[1] = new Grass (5, 26, 8, 2); //Lots of grass //
        grass[2] = new Grass (15, 26, 1, 2); //Grass Bot Left //
        grass[3] = new Grass (22, 26, 1, 2); //Grass Bot Right //
        grass[4] = new Grass (22, 14, 3, 12); //Lots of grass // 
        grass[5] = new Grass (3, 14, 3, 4); //Lots of grass //
        grass[6] = new Grass (-2, 14, 2, 2); //Lots of grass //
        grass[7] = new Grass (-2, 16, 3, 2); //Lots of grass //
      } else { //Top
        grass[0] = new Grass (27, 4, 3, 8);  //Lots of grass //
        grass[1] = new Grass (16, 2, 5, 2); //Lots of grass //
        grass[2] = new Grass (13, 0, 3, 12); //Lots of grass //
        grass[3] = new Grass (8, 0, 3, 12); //Lots of grass //
        grass[4] = new Grass (3, 0, 3, 14); //Lots of grass //
        grass[5] = new Grass (-2, 0, 2, 14); //Lots of grass //
      }
    }

    wall[0] = new Wall(30, -6, 1, 48);  //Right Wall //
    wall[1] = new Wall(13, 35, 2, 2);  //First Mid Tree // 
    wall[2] = new Wall(16, 38, 14, 4);  //Bot Right //
    wall[3] = new Wall(-2, 38, 14, 4);  //Bot Left // 
    wall[4] = new Wall(-3, -6, 1, 48);  //Left Wall // 
    wall[5] = new Wall(25, 28, 5, 6);  //Trees Bot Mid Right // 
    wall[6] = new Wall(6, 28, 6, 6); //Trees Mid Bot Left // 
    wall[7] = new Wall(-2, 26, 5, 8); //More Trees // 
    wall[8] = new Wall(16, 4, 6, 30);  //Mid Trees // 
    wall[9] = new Wall(25, 14, 3, 12);  //Trees Right //
    wall[10] = new Wall(-2, 20, 10, 4); //Trees Left //
    wall[11] = new Wall(6, 24, 10, 2);  //More Trees //
    wall[12] = new Wall(10, 14, 6, 10);  //More Trees // 
    wall[13] = new Wall(6, 14, 4, 4);  //More Trees // 

    wall[15] = new Wall(0, -6, 3, 22);  //More Trees //

    wall[17] = new Wall(24, 4, 3, 8);  //More Trees // 
    wall[18] = new Wall(16, -3, 12, 5);  //More Trees //
    wall[19] = new Wall(6, -2, 2, 16);  //More Trees //
    wall[20] = new Wall(11, -6, 2, 16);  //More Trees //
  }
}

