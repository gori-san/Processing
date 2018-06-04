PImage img; 
void setup() { 
  size(670, 443); 
  frameRate(3000);
  background(255); 
  img = loadImage("mount_fuji.jpg");
} 
void draw() { 
  int i = int(random(img.width)); 
  int j = int(random(img.height)); 
  color c = img.get(i, j);
  fill(c);
  noStroke();
  pushMatrix();
  translate(i,j);
  rotate(-PI/4);
  ellipse(0,0,8,4);
  popMatrix();
} 
