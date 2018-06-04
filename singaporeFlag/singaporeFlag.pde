void setup(){
  size(216,144);
  background(255,0,0);
  noLoop();
}

void draw(){
  noStroke();
  fill(255);
  rect(0,72,width,72);
  ellipse(45.5,36,26.5*2,26.5*2);
  fill(255,0,0);
  ellipse(60,36,29*2,29*2);
  drawStar(15.2 * cos(radians(-90)) + 60, 15.2 * sin(radians(-90)) + 36);
  drawStar(15.2 * cos(radians(144-90)) + 60, 15.2 * sin(radians(144-90)) + 36);
  drawStar(15.2 * cos(radians(2*144-90)) + 60, 15.2 * sin(radians(2*144-90)) + 36);
  drawStar(15.2 * cos(radians(3*144-90)) + 60, 15.2 * sin(radians(3*144-90)) + 36);
  drawStar(15.2 * cos(radians(4*144-90)) + 60, 15.2 * sin(radians(4*144-90)) + 36);
}





void drawStar(float x, float y){
  fill(255);
  noStroke();
  beginShape();
    vertex(6.4 * cos(radians(- 90)) + x, 6.4 * sin(radians(-90)) + y);
    vertex(6.4 * cos(radians(144 - 90)) + x, 6.4 * sin(radians(144 - 90)) + y);
    vertex(6.4 * cos(radians(2 * 144 - 90)) + x, 6.4 * sin(radians(2 * 144 - 90)) + y);
    vertex(6.4 * cos(radians(3 * 144 - 90)) + x, 6.4 * sin(radians(3 * 144 - 90)) + y);
    vertex(6.4 * cos(radians(4 * 144 - 90)) + x, 6.4 * sin(radians(4 * 144 - 90)) + y);
  endShape();
}
