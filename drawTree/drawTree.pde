int n = 0;

void setup(){
  size(800, 500);
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
  translate(width/2, height/3*2);
  drawtree(n,float(height/3));
}

void drawtree(int level, float length){
  if(level == 0){
    line(0,0,0,length);
    return;
  }
  
  drawtree(--level,length);
  
  pushMatrix(); 
  rotate(PI/ 6); 
  translate(0, -length/3*2);
  drawtree(level,length/3*2);
  popMatrix();
  
  pushMatrix(); 
  //translate(0,-length/2);
  rotate(-PI / 6); 
  translate(0, -length/3*2);
  drawtree(level,length/3*2);
  popMatrix();
  
}
