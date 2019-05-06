float rotation = 0;
int nItems = 0;
int sizeItems =0;

void setup(){
  size(1000,1000);
}

void draw(){
  background(0, 0,100);
  randomSeed(82);
  
  nItems = 30;
  sizeItems = width/nItems;
  float x, y;
  
  for(int i = 0; i < nItems; i++){
    for (int j = 0; j < nItems; j++){
      float offset = sizeItems/2;
      x = i * (sizeItems + offset);
      y = j * (sizeItems + offset);
      
      
      pushMatrix();
      translate( x, y);
      circles(0, 0, sizeItems);
      popMatrix();
    }
  }
  
}

void circles(float x, float y, float size){
  
  colorMode(HSB, 360, 100, 100);
  float hue1 = floor(random(0,360));
  float hue2 = hue1 + 35;
  float hue3 = hue1 - 35;
  float sat = 60;
  float bright = 60;
  float circleSize = sizeItems*0.5;
 float offset = sizeItems*0.2;
 rotation = random(0, TWO_PI);
 noStroke();
  pushMatrix();
  translate(0, 0);
   pushMatrix();
   fill(hue2, sat, bright);
   rotate(rotation);
     ellipse(x+offset, y+offset, circleSize, circleSize);
   popMatrix();
   pushMatrix();
     fill(hue3, sat, bright);
     rotate(rotation);
     ellipse(x-offset, y-offset, circleSize, circleSize);
   popMatrix();
   fill(hue1, sat, bright);
   ellipse(x, y, circleSize, circleSize);
  popMatrix();
}

void keyPressed(){
  if (key == 's' || key == 'S'){
    saveFrame("colors-###.png");
  }
}
