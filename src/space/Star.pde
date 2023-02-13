class Star {
  float x, y, diam, speed;

  PImage star;

  //Constructor
  Star() {
    x = int(random(width));
    y = int(random(height));
    diam = 50;
    speed = int(random(1, 5));
    star = loadImage("star 3.png");
  }

  void display() {
    star.resize(int(diam), int(diam));
    imageMode(CENTER);
    image(star, x, y);
  }

  void move () {
    if (y>height+5 ) {
      y = -5;
    } else {
      y += speed;
    }
  }

  boolean reachBottom() {
    if (y<height+5 ) {
      return true;
    } else {
      return false;
    }
  }
}
