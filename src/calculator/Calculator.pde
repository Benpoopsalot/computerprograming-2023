//Xarek Lyman | oct 31 | calculator project
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal ="0";
boolean left =true;
float l, r, result;
int val;
char op = ' ';

void setup() {
  size(460, 460);
  numButtons[0] = new Button(230, 410, 80, 80, '0');
  numButtons[1] = new Button(140, 140, 80, 80, '1');
  numButtons[2] = new Button(230, 140, 80, 80, '2');
  numButtons[3] = new Button(320, 140, 80, 80, '3');
  numButtons[4] = new Button(140, 230, 80, 80, '4');
  numButtons[5] = new Button(230, 230, 80, 80, '5');
  numButtons[6] = new Button(320, 230, 80, 80, '6');
  numButtons[7] = new Button(140, 320, 80, 80, '7');
  numButtons[8] = new Button(230, 320, 80, 80, '8');
  numButtons[9] = new Button(320, 320, 80, 80, '9');
  opButtons[0] = new Button(140, 410, 80, 80, '=');
  opButtons[1] = new Button(410, 140, 80, 80, '+');
  opButtons[2] = new Button(410, 230, 80, 80, '-');
  opButtons[3] = new Button(410, 320, 80, 80, '*');
  opButtons[4] = new Button(410, 410, 80, 80, '÷');
  opButtons[5] = new Button(320, 410, 80, 80, '±');
  opButtons[6] = new Button(50, 125, 80, 50, 'C');
  opButtons[7] = new Button(50, 185, 80, 50, '%');
  opButtons[8] = new Button(50, 245, 80, 50, '√');
  opButtons[9] = new Button(50, 305, 80, 50, 's');
  opButtons[10] = new Button(50, 365, 80, 50, 'π');
  opButtons[11] = new Button(50, 425, 80, 50, '.');
}

void draw() {
  background(150, 205, 150);
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay ();

  stroke(0);
}

void mouseReleased() {
  for (int i =0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length() < 21) {
      if (dVal.equals("0")) {
        dVal = str(numButtons[i].val);
      } else {
        dVal += str(numButtons[i].val);
      }
      val = int(numButtons[i].val-48);
      if (left) {  
        l = float(dVal);
      } else {
        r = float(dVal);
      }
    }
  }

  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      dVal = "0";
      left =  true;
      l = 0;
      r = 0;
      result = 0;
      op = ' ';
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      op = '+';
      dVal = "+";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      op = '-';
      dVal = "-";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '*') {
      op = '*';
      dVal = "*";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      op = '÷';
      dVal = "÷";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      if(left) {
        result = l+0.0;
      } else {
        result = r+0.0;
      }
      dVal = ".";
      ;
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      if(left) {
        result = l * PI;
      } else {
        result = r * PI;
      }
      dVal = "π";
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if(left) {
        result = sqrt(l);
      } else {
        result = sqrt(r);
      }
      dVal = "√";
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if(left) {
        result = l * -1;
      } else {
        result = r * -1;
      }
      dVal = "-";
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      op = '%';
      dVal = "%";
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      if(left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(l);
      }
      dVal = "x²";
    }
  }
  println("l:" + l + " r:" + r + " op:" + op + "result:" + result + "left:" + left);
}

void updateDisplay() {
  fill(0);
  rect(width/2, 50, width-20, 80, 10);
  fill(200);
  textAlign(RIGHT);
  textSize(50);
  text(dVal, width-50, 65);
  textSize(25);
  
  
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  }
  
  dVal = str(result);
  l = result;
  left  = true;
  
}
