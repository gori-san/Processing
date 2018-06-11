float scale = 10, r = 300;;
int z = 0, i = 1;
boolean isGrid = false, isAxis = true;

void setup(){
  size(800, 500, P3D);
  noStroke();
}

void draw(){
  background(255);
  lights();
  camera(400, 40, 400, 0, 0, 0, 0, -1, 0);
  //float cameraY = map(mouseY, 0, height, 400, -200);
  //float theta = map(mouseX, 0, width, 0, TWO_PI);
  //camera(300 * cos(theta), cameraY, 300 * sin(theta), 0, 0, 0, 0, -1, 0);
  drawAxis('X', color(255, 0, 0, 60)); // X霆ｸ + YZ蟷ｳ髱｢
  drawAxis('Y', color(0, 255, 0, 60)); // Y霆ｸ + XZ蟷ｳ髱｢
  drawAxis('Z', color(0, 0, 255, 60)); // Z霆ｸ + XY蟷ｳ髱｢
  translate(r*cos(i*PI/180),0,r*sin(i*PI/180));
  i++;
  rotateY(-radians(i%360));
  drawCar3D();
}

void drawCar3D(){
  noStroke();
  //body
  fill(255, 0, 0);
  pushMatrix();
    box(4*scale, 2*scale, 8*scale);
  popMatrix();
  pushMatrix();
    translate(0,1.5*scale,-scale);
    box(4*scale,1.5*scale,6*scale);
  popMatrix();
  fill(255);
  pushMatrix();
    translate(0,1.2*scale,-scale);
    box(3*scale,1.2*scale,6.1*scale);
  popMatrix();
  pushMatrix();
    translate(0,1.3*scale,-scale);
    box(4.1*scale,scale*0.8,5*scale);
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

void axis(char s, color c){
  int len = 700;
  fill(c); stroke(c);
  pushMatrix();
    if(isAxis){
      box(len, 1, 1);
      pushMatrix();
        translate(len / 2, 0, 0);
        sphere(3);
        text(s, 5, -5, 0);
      popMatrix();
    }
    if(isGrid){
      pushMatrix();
        translate(0, -len / 2, -len / 2);
        int ngrids = 20, xs = len / ngrids, ys = len / ngrids; // 譬ｼ蟄先焚�梧�ｼ蟄宣俣髫�
        for(int i = 1; i < ngrids; i++){
          line(0, 0, ys * i, 0, len, ys * i); // 讓ｪ譬ｼ蟄�
          line(0, xs * i, 0, 0, xs * i, len); // 邵ｦ譬ｼ蟄�
        }
      popMatrix();
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

void leaf(int r, int g, int b){
  fill(r, g, b);
  beginShape(TRIANGLES);
    vertex(0, .5, 0); vertex(-.5, 0, -.5); vertex(.5, 0, -.5);
    vertex(0, .5, 0); vertex(.5, 0, -.5); vertex(.5, 0, .5);
    vertex(0, .5, 0); vertex(.5, 0, .5); vertex(-.5, 0, .5);
    vertex(0, .5, 0); vertex(-.5, 0, .5); vertex(-.5, 0, -.5);
    vertex(-.5, 0, -.5); vertex(.5, 0, .5); vertex(.5, 0, -.5);
    vertex(-.5, 0, -.5); vertex(-.5, 0, .5); vertex(.5, 0, .5);
  endShape();
}

void leaves(){
  pushMatrix(); translate(0, .5, 0); scale(.6, .6, .6); leaf(0, 224, 0); popMatrix();
  pushMatrix(); translate(0, .25, 0); scale(.8, .8, .8); leaf(0, 192, 0); popMatrix();
  leaf(0, 128, 0);
}

void trunk(){
  fill(128, 64, 0);
  pushMatrix();
    scale(.2, .4, .2);
    translate(0, .5, 0);
    box(1);
  popMatrix();
}

void drawTree(float s){
  scale(s, s, s);
  trunk();
  translate(0, .4, 0);
  leaves();
}
