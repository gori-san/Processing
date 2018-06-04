/* @pjs font="TEMPSITC.TTF"; 
 */
 int size = 800, i = 1, add = 0;

void setup(){
  size(800, 800, P3D);
  noStroke();
  smooth();
  textFont(createFont("Tempus Sans ITC", 24));
  frameRate(60);
}

void draw(){
  background(255);
  translate(width / 2, height / 2, 0);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  drawAxis('X', color(255, 0, 0, 120)); // X-axis + YZ-plane
  drawAxis('Y', color(0, 255, 0, 120)); // Y-axis + XZ-plane
  drawAxis('Z', color(0, 0, 255, 120)); // Z-axis + XY-plane
  drawLegs();
  drawArms();
  drawBody();
}
void axis(char s, color c){
  int len = size;
  fill(c);
  stroke(c);
  box(len, 1, 1);
  pushMatrix();
    translate(len / 2, 0, 0);
    sphere(3);
    text(s, 5, -5, 0);
  popMatrix();
  pushMatrix();
    translate(0, -len / 2, -len / 2);
    int ngrids = 20; // # of grid
    int xs = len / ngrids, ys = len / ngrids; // grid  interval
    for(int i = 1; i < ngrids; i++){
      line(0, 0, ys * i, 0, len, ys * i); // horizontal grid
      line(0, xs * i, 0, 0, xs * i, len); // vertical grid
    }
  popMatrix();
}

void drawAxis(char s, color c){
  switch(s){
    case 'X':
      axis(s, c);
      break;
    case 'Y':
       pushMatrix();
        rotateZ(PI / 2);
         axis(s, c);
       popMatrix();
       break;
    case 'Z':
       pushMatrix();
        rotateY(-PI / 2);
         axis(s, c);
       popMatrix();
       break;
  }
}

void drawLegs(){
  fill(0,0,250);
  noStroke();
  pushMatrix();
    translate(-width/24,width/8,0);
    box(width/32,width/8+width/8,width/32);
  popMatrix();
  pushMatrix();
    translate(width/24,width/8,0);
    box(width/32,width/8+width/8,width/32);
  popMatrix();
}

void drawBody(){
  fill(0,250,0);
  noStroke();
  pushMatrix();
    translate(0,-width/8-30,0);
    sphere(50);
  popMatrix();
  pushMatrix();
    box(width/7,width/4,width/9);
  popMatrix();
}

void drawArms(){
  fill(250,0,0);
  noStroke();
   pushMatrix();
    translate(-width/18,-width/16,0);
    rotate(-PI/4+add*PI/180);
    //translate(-(width/8+width/16),0,0);
    box(width/32,width/8+width/16,width/32);
    translate((width/8+width/16)/4,-(width/8+width/16)/3-12,0);
    rotate(-PI/2);
    box(width/32,width/8-50,width/32);
  popMatrix();
  pushMatrix();
    translate(width/18,-width/16,0);
    rotate(PI/4+add*PI/180);
    box(width/32,width/8+width/16,width/32);
    translate(-(width/8+width/16)/4,-(width/8+width/16)/3-12,0);
    rotate(PI/2);
    box(width/32,width/8-50,width/32);
  popMatrix();
  add += i;
  if(add == 30){
    i *= -1;
  }else if(add == -30){
    i*=-1;
  }
}
