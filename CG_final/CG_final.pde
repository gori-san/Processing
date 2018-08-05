float rgb;
int building_num = 10, star_num=100;
float windowscale = 15;
int num;
int[] b1 = new int[building_num];
int[] b2 = new int[building_num];
int[] b3 = new int[building_num];
float[] starsX = new float[star_num];
float[] starsY = new float[star_num];
int p;
float speed;
float pole;
PImage skytree, castle, tower, plane, mountain;

float t = 0, s = 0.2;

void setup() {
  size(1000, 500);
  smooth();
  noStroke();
  skytree = loadImage("skytree.png");
  castle = loadImage("castle.png");
  tower = loadImage("tower.png");
  plane = loadImage("plane.png");
  mountain = loadImage("mountain.png");
  b1[0] = 0; b1[1] = 200; b1[2] = -500; b1[3] = 700;
  b2[0] = 0; b2[1] = 100; b2[2] = -500; b2[3]=250; b2[4]=400; b2[5]=800; b2[6]=-250;
  b3[0] = 0; b3[1] = 700; b3[2] = -500; p = 800;
  pole = 0;
  for(int i = 0; i<star_num; i++){
    starsX[i] = random(0,width);
    starsY[i] = random(0,height);
  }
  frameRate(30);
}

void draw() {
  speed = map(mouseY, 0, height, 30, 8);
  rgb = map(mouseX, 0, width, 110, 0);

  //Background
  background(90-rgb, 130-rgb, 224-rgb, 170);
  
  //star
  if(rgb >= 60){
    for(int k=0; k<star_num; k++){
      fill(255,180);
      ellipse(starsX[k],starsY[k],2,2);
    }
  }

  //sun,moon
  fill(255,200);
  ellipse(100,100,100,100);
  fill(255, 10);
  ellipse(100, 100, 120, 120);
  ellipse(100, 100, 140, 140);
  ellipse(100, 100, 160, 160);
  
  //mountain
  //image(mountain,-width/2,height/3,width*2,height);
  
  //plane
  pushMatrix();
    image(plane,p,height/10,height/10,height/10);
    p -= 1;
  popMatrix();
  if(p < -100) p = 1100;
  
  
  pushMatrix();
  translate(0,t);
  if(t>1.2) s*=-1;
  else if(t<-1.2) s*=-1;
  t+=s;
  
  //third layer
  image(castle,b3[0],height/2,height/2,height/2);
  image(skytree,b3[1],height-height/1.2,height/4,height/1.2);
  for(int i = 0; i < building_num; i++){
    b3[i]+=speed/8;
    if(b3[i] > width+200) b3[i] = -200;
  }
  
  //third layer
  pushMatrix();
    fill(100);
    translate(b2[0],1.2*height/2);
    drawBuilding(width/20+15, 1.2*height/2);
  popMatrix();
  
  pushMatrix();
    fill(100);
    translate(b2[1],height-1.2*height/2);
    drawBuilding(width/20+15, 1.2*height/2);
  popMatrix();
  
  pushMatrix();
    fill(100);
    translate(b2[2],height-height/3);
    drawBuilding(4*width/20+15, height/3);
  popMatrix();
  
  pushMatrix();
    fill(100);
    translate(b2[3],height-height/2);
    drawBuilding(width/20+15, height/2);
  popMatrix();
  
  pushMatrix();
    fill(100);
    translate(b2[4],height-height/5);
    drawBuilding(width/20+15, height/5);
  popMatrix();
  
  pushMatrix();
    fill(100);
    translate(b2[5],height-height/5);
    drawBuilding(width/20+15, height/5);
  popMatrix();
  
  pushMatrix();
    fill(100);
    translate(b2[6],height-height/5);
    drawBuilding(width/20+15, height/5);
  popMatrix();
  for(int i = 0; i < building_num; i++){
    b2[i]+=speed/2;
    if(b2[i] > width+200) b2[i] = -200;
  }
  
  //second layer
  pushMatrix();
    fill(25);
    translate(b1[0],height/2);
    drawBuilding(3*width/20+15, height/2);
  popMatrix();
  
  pushMatrix();
    fill(25);
    translate(b1[1],height-height/4);
    drawBuilding(3*width/20+15, height/4);
  popMatrix();
  
  pushMatrix();
    fill(25);
    translate(b1[2],height-height/4);
    drawBuilding(3*width/20+15, height/4);
  popMatrix();
  //tint(25);
  image(tower,b1[3],height-height/3,height/3,height/3);
  for(int i = 0; i < building_num; i++){
    b1[i]+=speed*1.5;
    if(b1[i] > width+200) b1[i] = -200;
  }
  fill(50);
  rect(pole,0,width/30,height);
  //rect(pole+500,0,width/50,height);
  pole += speed*5;
  if(pole > width+200) pole = -500;
  //firstlayer
  fill(150,100);
  rect(0,0,width,height);
  
  popMatrix();
  
  drawWindowframe();
}



void drawBuilding(float w, float h){
  //Building
  //fill(50);
  rect(0,0,w,h);
  
  //Window
  num = 0;
  for(int i = 1; i < h/windowscale; i+=2){
    for(int j=1; j < w/windowscale; j+=2){
      if(num%6==0 || num%7==0){
        drawWindow(j*windowscale,i*windowscale);
      }
      num++;
    }
  }
}

void drawWindow(float x, float y){
  fill(255);
  rect(x,y,windowscale,windowscale);
}



void drawWindowframe(){
  fill(0);
  rect(0,0,width/40,height);
  rect(width-width/40,0,width/40,height);
  rect(0,0,width,height/20);
  rect(0,height-height/20,width,height/20);
  rect(3*width/5,0,width/40,height);
}
