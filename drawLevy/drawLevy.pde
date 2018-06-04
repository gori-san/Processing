int n = 0;

void setup(){
  size(900, 700);
  textFont(createFont("Tempus Sans ITC", 24));
  fill(0);
  smooth();
}

void mousePressed(){
  if((mouseButton == LEFT) && (n < 15)) n++;
  else if((mouseButton == RIGHT) && (n > 0)) n--;
}

void draw(){
  background(255);
  text("n = " + n, 10, 30);
  translate(width/2, height/4);
  //line(-width/4,0,width/4,0);
  drawlevy(n,float(width/2));
}

void drawlevy(int level, float length){
  if(level == 0){
    line(-length/2,0,length/2,0);
    return;
  }
  
  pushMatrix();
  //rotate(PI/4);
  translate(-length/4,length/4);
  rotate(PI/4);
  drawlevy(--level,length/sqrt(2));
  popMatrix();
  
  
    pushMatrix();
  //rotate(PI/4);
  translate(length/4,length/4);
  rotate(-PI/4);
  drawlevy(level,length/sqrt(2));
  popMatrix();
}
