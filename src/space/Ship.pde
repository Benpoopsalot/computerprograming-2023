class Ship {
  int x, y, w, ammo, turretCount, health, loopCount;
  PImage[] ship = new PImage[10];
  PImage[] ship1 = new PImage[10];
  PImage[] ship2 = new PImage[10];
  PImage[] ship3 = new PImage[10];
  PImage[] explosion = new PImage [13];
  boolean animate;
  //Constructor
  Ship() {

    x = 0;
    y = 0;
    //width
    animate = true;
    w = 0;
    ammo = 50;
    turretCount = 1;
    health = 400;
    ship[0] = loadImage("ship1.png");
    ship[1] = loadImage("ship1 (1).png");
    ship[2] = loadImage("ship1 (2).png");
    ship[3] = loadImage("ship1 (3).png");
    ship[4] = loadImage("ship1 (4).png");
    ship[5] = loadImage("ship1 (5).png");
    ship[6] = loadImage("ship1 (6).png");
    ship[7] = loadImage("ship1 (7).png");

    explosion[0] = loadImage("ship destruction (1).png");
    explosion[1] = loadImage("ship destruction (2).png");
    explosion[2] = loadImage("ship destruction (3).png");
    explosion[3] = loadImage("ship destruction (4).png");
    explosion[4] = loadImage("ship destruction (5).png");
    explosion[5] = loadImage("ship destruction (6).png");
    explosion[6] = loadImage("ship destruction (7).png");
    explosion[7] = loadImage("ship destruction (8).png");
    explosion[8] = loadImage("ship destruction (9).png");
    explosion[9] = loadImage("ship destruction (10).png");
    explosion[10] = loadImage("ship destruction (11).png");
    explosion[11] = loadImage("ship destruction (12).png");
    explosion[12] = loadImage("New Piskel (17).png");


    ship1[0] = loadImage("SHIP damaged 3 animated (1).png");
    ship1[1] = loadImage("SHIP damaged 3 animated (2).png");
    ship1[2] = loadImage("SHIP damaged 3 animated (3).png");
    ship1[3] = loadImage("SHIP damaged 3 animated (4).png");
    ship1[4] = loadImage("SHIP damaged 3 animated (5).png");
    ship1[5] = loadImage("SHIP damaged 3 animated (6).png");
    ship1[6] = loadImage("SHIP damaged 3 animated (7).png");
    ship1[7] = loadImage("SHIP damaged 3 animated (8).png");

    ship2[0] = loadImage("ship3 1.png");
    ship2[1] = loadImage("ship3 2.png");
    ship2[2] = loadImage("ship3 3.png");
    ship2[3] = loadImage("ship3 4.png");
    ship2[4] = loadImage("ship3 5.png");
    ship2[5] = loadImage("ship3 6.png");
    ship2[6] = loadImage("ship3 7.png");
    ship2[7] = loadImage("ship3 8.png");

    ship3[0] = loadImage("New Piskel (9).png");
    ship3[1] = loadImage("New Piskel (10).png");
    ship3[2] = loadImage("New Piskel (11).png");
    ship3[3] = loadImage("New Piskel (12).png");
    ship3[4] = loadImage("New Piskel (13).png");
    ship3[5] = loadImage("New Piskel (14).png");
    ship3[6] = loadImage("New Piskel (15).png");
    ship3[7] = loadImage("New Piskel (16).png");
  }

  void display() {
    imageMode(CENTER);
    if (s1.health>300) {
      image(ship[millis()/100%7], x, y);
    } else if (s1.health>100&&s1.health<=200) {
      image(ship2[millis()/100%7], x, y);
    } else if (s1.health<1) {
      s1.explosion();
      //noLoop();
    } else if (s1.health<=100) {
      image(ship3[millis()/100%7], x, y);
    } else if (s1.health<=300&&s1.health>200) {
      image(ship1[millis()/100%7], x, y);
    }
  }

  void move(int tempx, int tempy) {
    x = tempx;
    y = tempy;
  }

  void explosion() {
    if (animate) {
      imageMode(CENTER);
      image(explosion[millis()/100%13 ], x, y);
      animate = false;
    }else {
      image(explosion[12], x,y);
    }
  }




  boolean fire() {
    if (ammo>0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<rock.diam) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(PowerUp powerup) {
    float d = dist(x, y, powerup.x, powerup.y);
    if (d<powerup.diam) {
      return true;
    } else {
      return false;
    }
  }
}
