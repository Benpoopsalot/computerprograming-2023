//Xarek Lyman | 11/28/2022 | Space game //<>//
import processing.sound.*;
SoundFile  laser;
SoundFile  die;
SoundFile soundtrack;
Ship s1;
Timer RockTimer;
Timer PowerUpTimer;
Timer SoundTrackTimer;

ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> pups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Star[] stars = new Star[100];
int score, level, RockCount, LaserCount, died;
boolean play;

void setup() {
  size(800, 1000);
  laser = new SoundFile(this, "blaster1.wav");
  die = new SoundFile(this, "explosion.wav");
  soundtrack = new SoundFile(this, "space game soundtrack.wav");
  s1 = new Ship();
  //how long before new rock spawns
  RockTimer = new Timer(1000);
  RockTimer.start();
  PowerUpTimer = new Timer(10000);
  PowerUpTimer.start();
  SoundTrackTimer = new Timer(138000);
  SoundTrackTimer.start();




  soundtrack.play();
  if (SoundTrackTimer.isFinished()) {
    soundtrack.stop();
    soundtrack.play();
  }




  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  RockCount = 0;
  LaserCount = 1;
  play = false;
}

void draw() {


  if (play == false) {
    startScreen();
  } else {
    if (s1.health<1) {
      //s1.display();

      s1.ammo = 0;
      gameOver();
      //soundtrack.stop();
    } else {
      background(20);
      //rendering stars
      for (int i=0; i<stars.length; i++) {
        stars[i].display();
        stars[i].move();
      }
      infoPanel();
      noCursor();
      //distributing rocks
      if (RockTimer.isFinished()) {
        rocks.add(new Rock());
        RockTimer.start();
        if (PowerUpTimer.isFinished()) {
          pups.add(new PowerUp());
          PowerUpTimer.start();
        }
      }
    }
    //rendering rocks and detecting ship collision
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      //hitting rocks
      if (s1.intersect(r)) {
        s1.health-=r.diam;
        score-=r.diam;
        //todo: add sound of explosion
        //todo: add animation of explosion
        //todo: visual effect on the ship
        rocks.remove(r);
      }
      if (r.reachBottom()) {
        rocks.remove(r);
        println(rocks.size());
      } else {
        r.display();
        r.move();
      }
    }
    //rendering power ups
    for (int i = 0; i < pups.size(); i++) {
      PowerUp p = pups.get(i);
      //hitting rocks
      if (s1.intersect(p)) {
        if (p.type == 'h') {
          s1.health+=p.diam;
        } else if (p.type == 'a') {
          s1.ammo+=p.diam;
        } else {
          s1.turretCount++;
        }
        pups.remove(p);
      }
      if (p.reachBottom()) {
        pups.remove(p);
        println(pups.size());
      } else {
        p.display();
        p.move();
      }
    }

    // render lasers on screen
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j< rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          lasers.remove(l);
          r.diam -= 50;
          if (r.diam<20) {
            rocks.remove(r);
            lasers.remove(l);
          }
          score+=50;
        }
        if (l.reachTop()) {
          lasers.remove(l);
          println(lasers.size());
        } else {
          l.display();
          l.move();
        }
      }
    }
    //render spaceship
    s1.display();
    s1.move(mouseX, mouseY);
  }
}



void mousePressed() {
  if (play) {
    laser.stop();
    laser.play();

    if (s1.ammo<1) {
      laser.stop();
    } else {
      if (s1.fire()&&s1.turretCount == 1) {
        lasers.add(new Laser(s1.x, s1.y));
      } else if (s1.fire() && s1.turretCount == 2) {

        lasers.add(new Laser(s1.x+20, s1.y));
        lasers.add(new Laser(s1.x-20, s1.y));
      } else if (s1.fire()&&s1.turretCount == 3) {
        lasers.add(new Laser(s1.x+20, s1.y));
        lasers.add(new Laser(s1.x-20, s1.y));
        lasers.add(new Laser(s1.x, s1.y));
      } else if (s1.fire()&&s1.turretCount == 4) {
        lasers.add(new Laser(s1.x+20, s1.y));
        lasers.add(new Laser(s1.x-20, s1.y));
        lasers.add(new Laser(s1.x+40, s1.y));
        lasers.add(new Laser(s1.x-40, s1.y));
      } else if (s1.fire()&&s1.turretCount == 5) {
        lasers.add(new Laser(s1.x+20, s1.y));
        lasers.add(new Laser(s1.x-20, s1.y));
        lasers.add(new Laser(s1.x+40, s1.y));
        lasers.add(new Laser(s1.x-40, s1.y));
        lasers.add(new Laser(s1.x, s1.y));
      }
    }
  }
}

void infoPanel() {
  fill(129, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(25);
  textAlign(CENTER);
  text("Health: " + s1.health  + " | Score: " + score + " | Ammo: " + s1.ammo + " | Turret Count: " + s1.turretCount, width/2, 35);
}

void startScreen() {
  background(20);
  for (int i=0; i<stars.length; i++) {
    stars[i].display();
    stars[i].move();
  }
  fill(255, 250, 255);
  textSize(20);
  text("CLICK TO START", width/2, height/2);
  textAlign(CENTER);
  if (mousePressed) {
    play =  true;
  }
}

void gameOver() {
  background(20);
  fill(255, 250, 255);
  died+= 1;
  if (died == 1) {
    //die.stop();
    die.play();
  }
  text("GAME OVER", width/2, height/2-50);
  text("SCORE:" +score, width/2, height/2);
  text("CLICK TO PLAY AGAIN", width/2, height/2+50);
  textAlign(CENTER);
  s1.display();
  if (mousePressed) {
    s1.health = 400;
    s1.ammo = 50;
    s1.turretCount = 1;
    score = 0;
    s1.animate = true;
    startScreen();
    play =  false;


    //noLoop();
  }
}
