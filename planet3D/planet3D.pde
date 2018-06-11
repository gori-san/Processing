/* @pjs font="TEMPSITC.TTF"; 
 */
float scale = 2;
float R = 300;
int i = 0, j = 0;

void setup(){
  size(1000, 600, P3D);
  noStroke();
  smooth();
  textFont(createFont("Tempus Sans ITC", 24));
}

void draw(){
  background(255);
  translate(width / 2, height / 2, 0);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  drawAxis('X', color(255, 0, 0, 50)); // X-axis + YZ-plane
  drawAxis('Y', color(0, 255, 0, 50)); // Y-axis + XZ-plane
  drawAxis('Z', color(0, 0, 255, 50)); // Z-axis + XY-plane
  drawSun();
  drawEarth();
}
void axis(char s, color c){
  int len = 1000;
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

void drawSun(){
  noStroke();
  fill(200, 30, 30);
  sphere(20*scale);
}

void drawEarth(){
  noStroke();
  fill(20,20,255);
  pushMatrix();
    translate(R*sin(i*PI/180), 0 , R*cos(i*PI/180));
    sphere(5*scale);
  popMatrix();
  drawMoon(R*sin(i*PI/180),R*cos(i*PI/180));
  i++;
  if(i > 360) i = 0;
}

void drawMoon(float x, float z){
  
}
