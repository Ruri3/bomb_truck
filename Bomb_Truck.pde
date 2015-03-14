PImage bg;
PImage truckLeft;
PImage truckRight;

void setup(){
  size (800, 500);
  background(#FFFFFF);
  frameRate(120);
  bg = loadImage("forest.jpg");
  truckLeft = loadImage("truckleft.gif");
  truckRight = loadImage("truckright.gif");
}

float x = random(50, 750);
float y = -20;
float boop = 0.5;
float truckX;
float truckY = 420;
int direction;
int score;
int gameover;


void draw(){
    
  background(bg);
  
  if (gameover == 1){
    textSize(30);
    fill(#FFFFFF);
    text("GAME OVER", 300, 100);
    text("Score:", 325, 150);
    text(score, 425, 150);
  }
  fill(#FFFFFF);
  textSize(20);
  text(score, 30, 30);
  
  if (keyPressed){
    switch (keyCode){
      case RIGHT: truckX = truckX + 2.5; 
      direction = 0; break;
      case LEFT: truckX = truckX - 2.5; 
      direction = 1; break;
       }
         }
 if (direction == 0){
 image(truckRight, truckX, truckY); 
 } else{
 image(truckLeft, truckX, truckY);
 }
    
  if (truckX < 0){
    truckX = 0;
  }
  if (truckX > 700){
    truckX = 0;
    score = score +1;
  }

  y = y + boop;
  boop = boop + 0.05;
  
  fill (#EA0202);
  stroke(10);
  rect(x - 2, y - 40, 4, 40);
  
  fill (#000000);
  stroke(1);
  ellipse(x, y, 50, 50);
  
  if (y > 400){
      fill(#EA0202);
      ellipse(x, y, 200, 200);
      y = y + 10;
      if(x < truckX + 140){
        if (x > truckX){
        truckY = 800;
        gameover = 1;
        }
      }
  }
  
  if (y > 830){
      x = random(50, 650);
      y = -20;
      boop = 1;
       }
}
