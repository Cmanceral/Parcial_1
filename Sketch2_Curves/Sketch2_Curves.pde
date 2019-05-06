float a = 0;

void setup() {
  size(1000, 1000);
  background(10);
  frameRate(23.97);
  smooth();
}

void draw() {
  //background(0);
  float n = noise(a*0.6)*width;
  
  float sin = sin(a * 0.8)*2;
  float sin1 =  sin + (n - 500);
  float sin2 = sin + (n + 500);

  color from = color(203, 137, 37);
  color to = color(6, 64, 121);
  
  color gradient = lerpColor(from, to, sin);
  stroke(gradient, 20);
  
  float x = n * 0.1;
  x = map(x, 0, 1, -1, 1);
  float y = n * 0.1;
  y = map(y, 0, 1, 1, -1);
 
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians((n*0.06)+a));
  sin1 = sin1 + n;
  sin2 = sin2 + n;
  sin1 = map(sin, -1, 1, -width/2, width/2);
  sin2 = map(sin, -1, 1, width/2, -width/2);
  curves(x,y, sin2, sin1, n - 800  , n + 200);
  popMatrix();
  
  a+=0.01;
  
  saveFrame("Curves_#####.png");
}

void curves (float x, float y, float xMove1, float xMove2, float yMove1, float yMove2) {

  float x1 = x;
  float y1 = y - (height * 0.35);
  float xCtrl1 = xMove1;
  float yCtrl1 = yMove1;

  float x2 = x1;
  float y2 = y + (height*0.35);
  float xCtrl2 = xMove2;
  float yCtrl2 = yMove2;

  noFill();
  bezier(x1, y1, xCtrl1, yCtrl1, xCtrl2, yCtrl2, x2, y2);
  bezier(x1, y1, xCtrl2, yCtrl2, xCtrl1, yCtrl1, x2, y2);
  
}

/*
void keyPressed(){
  if (key == 's' || key == 'S'){
    saveFrame("Curves_#####.png");
  }
}*/
