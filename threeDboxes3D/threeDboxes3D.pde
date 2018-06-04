float num = 11;
float scale = 15;
float space = 15;

void setup(){
  size(800, 800, P3D);
  noStroke();
  background(255);
}

void draw(){
  background(255);
  translate(width/2,height/2,-50);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  drawBoxes();
}

void drawBoxes(){
  lights();
  colorMode(RGB);
  for(int i = -5; i < num/2; i++){
    for(int j = -5; j < num/2; j++){
      for(int k = -5; k < num/2; k++){
        pushMatrix();
          translate((space + scale)*i ,(space + scale)*j, (space + scale)*k);
          box(scale);
          fill(255-i*20,255-j*20,255 - k*20);
        popMatrix();
      }
    }
  }
}
