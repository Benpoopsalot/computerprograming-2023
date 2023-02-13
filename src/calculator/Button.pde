//Buttons tab
class Button {
  //Member Variables
  int x, y, w, h;
  char val;
  //c1 normal, c2 hover, c3 click?
  color c1, c2;
  boolean on;

  //Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h; //<>// //<>//
    this.val = val;
    c1 = color(150, 150, 205); //<>// //<>//
    c2 = color(200, 200, 255);
    on = false; //<>// //<>//
  }

  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER); //<>// //<>//
    rect(x, y, w, h, 10);
     fill(0); //<>// //<>//
    textAlign(CENTER);
    if (val == 'C') {
      text("CLEAR",x,y+5);
    } else if (val == 's') {
      text("x²", x,y+5);
    }else {
      text(val, x,y+5);
    }
  }
  

  void hover(int mx, int my) {
    on = (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2);
  }
}
