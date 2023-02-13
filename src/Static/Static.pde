//Xarek Lyman | 28/9/22 | Looping

void setup() {
  size(2000, 1050);
  frameRate(1000);
}

void draw() {
  background(255);
for (int x=0; x<width; x=x+1) {
  for (int y=0; y<height; y+=1) {
    fill(random(255),random(255),random(255));
    stroke(random(255),random(255),random(255));
    rect(x,y,1,1);
   }
}
//noLoop();
}
