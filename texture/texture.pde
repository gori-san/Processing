float scale = 10;
boolean isGrid = true, isAxis = true;
PImage img;
void setup(){
  size(800, 500, P3D);
  img = loadImage("sorry.jpg");
  noStroke();
}

void drawCar3D(){
  noStroke();
  //body
  fill(255, 0, 0);
  pushMatrix();
    texturedBox(4*scale, 2*scale, 8*scale);
  popMatrix();
  pushMatrix();
    translate(0,1.5*scale,-scale);
    texturedBox(4*scale,1.5*scale,6*scale);
  popMatrix();
  fill(255);
  pushMatrix();
    translate(0,1.2*scale,-scale);
    texturedBox(3*scale,1.2*scale,6.1*scale);
  popMatrix();
  pushMatrix();
    translate(0,1.3*scale,-scale);
    texturedBox(4.1*scale,scale*0.8,5*scale);
  popMatrix();
  
  
  //tire
  fill(0);
  pushMatrix();
    rotateZ(PI/2);
    translate(-scale, 1.6*scale, -2.5*scale);
    pillar(scale,scale,scale);
  popMatrix();
  pushMatrix();
    rotateZ(PI/2);
    translate(-scale, 1.6*scale, 2.5*scale);
    pillar(scale,scale,scale);
  popMatrix();
  pushMatrix();
    rotateZ(PI/2);
    translate(-scale, -1.6*scale, 2.5*scale);
    pillar(scale,scale,scale);
  popMatrix();
  pushMatrix();
    rotateZ(PI/2);
    translate(-scale, -1.6*scale, -2.5*scale);
    pillar(scale,scale,scale);
  popMatrix();
}

void draw(){
  background(255);
  lights();
  camera(150, 20, 100, 0, 0, 0, 0, -1, 0);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  drawCar3D();
  /*
  pushMatrix();
    drawAxis('X', color(255, 0, 0, 60)); // X霆ｸ + YZ蟷ｳ髱｢
    drawAxis('Y', color(0, 255, 0, 60)); // Y霆ｸ + XZ蟷ｳ髱｢
    drawAxis('Z', color(0, 0, 255, 60)); // Z霆ｸ + XY蟷ｳ髱｢
    drawCar3D();
  popMatrix();
  */
}


void pillar(float length, float radius1 , float radius2){
float x,y,z; 
pushMatrix();

beginShape(TRIANGLE_FAN);
y = -length / 2;
vertex(0, y, 0);
for(int deg = 0; deg <= 360; deg = deg + 10){
x = cos(radians(deg)) * radius1;
z = sin(radians(deg)) * radius1;
vertex(x, y, z);
}
endShape(); 

beginShape(TRIANGLE_FAN);
y = length / 2;
vertex(0, y, 0);
for(int deg = 0; deg <= 360; deg = deg + 10){
x = cos(radians(deg)) * radius2;
z = sin(radians(deg)) * radius2;
vertex(x, y, z);
}
endShape();

beginShape(TRIANGLE_STRIP);
for(int deg =0; deg <= 360; deg = deg + 5){
x = cos(radians(deg)) * radius1;
y = -length / 2;
z = sin(radians(deg)) * radius1; 
vertex(x, y, z);

x = cos(radians(deg)) * radius2;
y = length / 2;
z = sin(radians(deg)) * radius2; 
vertex(x, y, z);

}
endShape();

popMatrix(); 
}

void texturedBox(float x, float y, float z){
  scale(x, y, z);
  pushMatrix();
    translate(-.5, -.5, -.5);
    beginShape(QUADS);
      texture(img);
      textureMode(NORMAL);
      vertex(0, 1, 0, 0, 0); vertex(0, 0, 0, 0, 1);
        vertex(1, 0, 0, 1, 1); vertex(1, 1, 0, 1, 0);
      vertex(1, 1, 0, 0, 0); vertex(1, 0, 0, 0, 1);
        vertex(1, 0, 1, 1, 1); vertex(1, 1, 1, 1, 0);
      vertex(1, 1, 1, 0, 0); vertex(1, 0, 1, 0, 1);
        vertex(0, 0, 1, 1, 1); vertex(0, 1, 1, 1, 0);
      vertex(0, 1, 1, 0, 0); vertex(0, 0, 1, 0, 1);
        vertex(0, 0, 0, 1, 1); vertex(0, 1, 0, 1, 0);
      vertex(0, 1, 1, 0, 0); vertex(0, 1, 0, 0, 1);
        vertex(1, 1, 0, 1, 1); vertex(1, 1, 1, 1, 0);
      vertex(0, 0, 0, 0, 0); vertex(0, 0, 1, 0, 1);
        vertex(1, 0, 1, 1, 1); vertex(1, 0, 0, 1, 0);
    endShape();
  popMatrix();
}
