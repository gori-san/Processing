size(240, 150);
PImage img = loadImage("koujirou.jpg");
image(img, 0, 0);
img.filter(GRAY);
image(img, img.width, 0);
