float scale = 100;
boolean isGrid = true, isAxis = true;
PImage img;
void setup(){
  size(400, 300, P3D);
  img = loadImage("Brick.jpg");
  noStroke();
}

void draw(){
  background(255);
  lights();
  translate(200,150,-150);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  scale(200);
  texturedTriangle(1,1,1);
}

void texturedBox(float x, float y, float z){
  //scale(x, y, z);
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

void texturedTriangle(float x, float y, float z){
  scale(x,y,z);
  pushMatrix();
    beginShape(TRIANGLES);
    texture(img);
    textureMode(NORMAL);
    vertex(0, .5, 0, 0.5, 0); vertex(-.5, 0, -.5, 0, 1); vertex(.5, 0, -.5, 1,1);
    vertex(0, .5, 0, 0.5, 0); vertex(.5, 0, -.5, 0, 1); vertex(.5, 0, .5, 1,1);
    vertex(0, .5, 0, 0.5, 0); vertex(.5, 0, .5, 0, 1); vertex(-.5, 0, .5, 1,1);
    vertex(0, .5, 0, 0.5, 0); vertex(-.5, 0, .5, 0, 1); vertex(-.5, 0, -.5, 1,1);
    vertex(-.5, 0, -.5, 0.5, 0); vertex(.5, 0, .5, 0, 1); vertex(.5, 0, -.5, 1,1);
    vertex(-.5, 0, -.5, 0.5, 0); vertex(-.5, 0, .5, 0, 1); vertex(.5, 0, .5, 1,1);
    endShape();
  popMatrix();
}
