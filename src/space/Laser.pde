class Laser {
  int x, y, w, h, speed;
  color c1;


  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 8;
    h = 40;
    speed = 10;
    c1 = color(255, 0, 0);
  }

  void display() {
    rectMode(CENTER);
    noStroke();
    fill(c1);
    rect(x, y, w, h);
  }

  void move() {

    y -= speed;
  }

  boolean reachTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<rock.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
