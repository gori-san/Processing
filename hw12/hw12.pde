float scale = 10, r = 300;;
int z = 0, i = 1, j = 1, k=0, l = 2, m = 0;
boolean isGrid = false, isAxis = false;
PImage img;
void setup(){
  size(800, 500, P3D);
  img = loadImage("gray.jpg");
  noStroke();
}

void draw(){
  background(255);
  directionalLight(180,180,180, -.5, .5, -1); 
  ambientLight(128,128,128);
  camera(100, 100, 0, 0, 0, 0, 0, -1, 0);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  /*
  float cameraY = map(mouseY, 0, height, 400, -200);
  float theta = map(mouseX, 0, width, 0, TWO_PI);
  camera(300 * cos(theta), cameraY, 300 * sin(theta), 0, 0, 0, 0, -1, 0);
  */
  pushMatrix();
  drawAxis('X', color(255, 0, 0, 60)); // X髴�ｽｸ + YZ陝ｷ�ｳ鬮ｱ�｢
  drawAxis('Y', color(0, 255, 0, 60)); // Y髴�ｽｸ + XZ陝ｷ�ｳ鬮ｱ�｢
  drawAxis('Z', color(0, 0, 255, 60)); // Z髴�ｽｸ + XY陝ｷ�ｳ鬮ｱ�｢
  popMatrix();
  
  k += j;
  m += l;
  if(k > 50 || k < -50){
    j *= -1;
  }
  if(m > 50 || m < -50){
    l *= -1;
  }
  
  drawCar3D();
}

void drawCar3D(){
  noStroke();
  //body
  fill(255);
  pushMatrix();
    texturedBox(4*scale, 2*scale, 8*scale);
    ambient(0,0,77); 
    specular(53,53,255); 
    emissive(23,109,143); 
    shininess(33);
  popMatrix();
  pushMatrix();
    translate(0,1.5*scale,-scale);
    texturedBox(4*scale,1.5*scale,6*scale);
    ambient(100,255,29); 
    specular(128,128,128); 
    emissive(128,128,128); 
    shininess(0);
  popMatrix();
  fill(255);
  pushMatrix();
    translate(0,1.2*scale,-scale);
    texturedBox(3*scale,1.2*scale,6.1*scale);
  popMatrix();
  pushMatrix();
    translate(0,1.3*scale,-scale);
    texturedBox(4.1*scale,scale*0.8,5*scale);
    ambient(100,125,29); 
    specular(128,128,128); 
    emissive(80,80,80); 
    shininess(50);
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
      texturedBox(len, 1, 1);
      pushMatrix();
        translate(len / 2, 0, 0);
        sphere(3);
        text(s, 5, -5, 0);
      popMatrix();
    }
    if(isGrid){
      pushMatrix();
        translate(0, -len / 2, -len / 2);
        int ngrids = 20, xs = len / ngrids, ys = len / ngrids; // 隴ｬ�ｼ陝��辟夲ｿｽ譴ｧ�ｽ�ｼ陝�ｮ｣菫｣鬮ｫ�ｽ
        for(int i = 1; i < ngrids; i++){
          line(0, 0, ys * i, 0, len, ys * i); // 隶難ｽｪ隴ｬ�ｼ陝�ｿｽ
          line(0, xs * i, 0, 0, xs * i, len); // 驍ｵ�ｦ隴ｬ�ｼ陝�ｿｽ
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
