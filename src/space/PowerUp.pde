class PowerUp {
  int x, y, diam, speed;
  char type;
  PImage PowerUpH;
  PImage PowerUpT;
  PImage PowerUpA;

  //Constructor
  PowerUp() {
    x = int(random(width));
    y = -50;
    diam = 50;
    speed = int(random(5, 15));
    PowerUpH = loadImage("health.png");
    PowerUpT = loadImage("turret.png");
    PowerUpA = loadImage("ammo.png");
    int rand = int(random(3));
    if (rand == 0)
    {
      type = 'h';
    } else if (rand == 1) {
      type = 't';
    } else {
      type = 'a';
    }
  }

  void display() {
    if (type == 'h') {
      image(PowerUpH, x, y);
    } else if (type == 't') {
      image(PowerUpT, x, y);
    } else if (type == 'a') {
      image(PowerUpA, x, y);
    }
    imageMode(CENTER);
  }

  void move () {
    y += speed;//y = y+speed
  }

  boolean reachBottom() {
    if (y>height+5 ) {
      return true;
    } else {
      return false;
    }
  }
}
