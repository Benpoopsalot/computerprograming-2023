class Rock {
  int x, y, diam, speed;
  PImage Rock;

  //Constructor
  Rock() {
    x = int(random(width));
    y = -50;
    diam = int(random(100, 200));
    speed = int(random(5, 15));
    Rock = loadImage("rock.png");
  }

  void display() {
    Rock.resize(diam, diam);
    imageMode(CENTER);
    image(Rock, x, y);
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
