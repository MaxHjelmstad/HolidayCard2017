
PImage pineTree;
snowflake[]snowfall=new snowflake[500];
PImage moon;
PImage comet;
int moonX=-100;
int moonY=200;
int cometX=-100;
int cometY=200;
float lightFlicker=240;
boolean lightOn=true;
void setup() {
  ellipseMode(CENTER);
  noStroke();
  size(1600, 900);
  background(11, 0, 159);
  frameRate(60);

  for (int i =0; i<500; i++) {
    snowfall[i]= new snowflake((int)random(0, 1600), (int)random(-900, 0), (int)random(1, 4), (int) random(1, 5));
  }

  pineTree= loadImage("PineTree.png");   
  moon=loadImage("Moon.png");
  comet=loadImage("Comet.png");
}

void draw() { 
  textAlign(CENTER);
  background(9, 1, 60);
  fill(255, 0, 0);
  textSize(64);
  text("Merry Christmas!", 800, 200);
  fill(245);
  rect(0, 650, 1600, 250);
  //fill(245);
  //ellipse(1600, 670, 300, 100);
  //fill(169);
  //quad(730, 650, 880, 650, 1200, 900, 900, 900);
  image(pineTree, 400, 500, 300, 300);
  image(moon, moonX, moonY, 100, 100);
  image(comet, cometX, cometY, 100, 100);
  cometX+=80;
  if (cometX>50000) {
    cometX=-100;
  }
  //moonX+=5;
  //if(moonX>1700){
  // moonX=-100; 
  //}
  //fill(57, 38, 19);
  fill(114, 123, 132);
  rect(1130, 505, 30, 50 );
  fill(0, 51, 0);
  triangle(1200, 485, 1085, 600, 1315, 600);
  fill(86, 47, 14);
  rect(1100, 600, 200, 150);
  triangle(1200, 500, 1100, 600, 1300, 600);
  fill(0);
  rect(1100, 728, 200, 2);
  rect(1100, 706, 200, 2);
  rect(1100, 684, 200, 2);
  rect(1100, 662, 200, 2);
  rect(1100, 640, 200, 2);
  rect(1100, 618, 200, 2);
  rect(1103, 596, 193, 2);
  //rect(1199, 500, 2, 96);
  //rect(1177, 528, 2, 68);
  fill(153, 0, 0);
  rect(1200, 660, 50, 90);
  fill(0, 128, 0);
  fill(0);
  ellipse(1240, 708, 8, 8);
  rect(1120, 660, 45, 45);
  fill(255, 184, 10, lightFlicker);
  rect( 1120, 660, 20, 20);
  rect( 1145, 660, 20, 20);
  rect( 1120, 685, 20, 20);
  rect( 1145, 685, 20, 20);
  fill(255, 184, 10, lightFlicker/4);
  quad( 1165, 660, 1120, 660, 1060, 850, 1225, 850);
  //lightFlicker= random(100,200);
  if (lightOn==false) {
    lightFlicker+=3;
  } else {
    lightFlicker-=3;
  }
  if (lightFlicker<100) {
    lightOn=false;
  }
  if (lightFlicker>240) {
    lightOn=true;
  }
  for (snowflake s : snowfall) {
    s.drawSnow();
    s.snowMovement();
  }
}


class snowflake { 
  private int x;
  private int y;
  private int w;
  private int h;
  private int S;
  public snowflake(int xPos, int yPos, int Size, int speed) {
    x=xPos;
    y=yPos;
    w=Size;
    h=Size;
    S=speed;
  }
  public void drawSnow() {
    fill(255);
    ellipse(x, y, w, h);
  } 

  public void snowMovement() {
    y+=S;
    x+=S;

    if (y>=900) {
      y=0;
    }
    if (x>=1600) {
      x=0;
    }
  }
}
