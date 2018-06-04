size(300,300);
background(255);
colorMode(HSB, 100);

for(int i = 0; i < 100; i++){
  stroke(i,100,100);
  line(150,150,120*cos(radians(i*3.6))+150,120*sin(radians(i*3.6))+150);
  noStroke();
  ellipse(150,150,100,100);
}
