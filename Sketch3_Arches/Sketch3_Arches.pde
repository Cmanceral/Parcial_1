int nCircles = 10;
int rotation = 0;
float a = 0;

void setup() {
  size(1000, 1000);
}

void draw() {
  background(255, 244, 26);
  float circleSize = width/nCircles;
  
  for (int i = 0; i < nCircles; i++) {
    for (int j = 0; j < nCircles; j++) {
      float x = circleSize*i;
      float y = circleSize*j;
      float offset = circleSize/2;
      int index = i+j;
      float sine = sin(a *(index*0.3));
      sine = map(sine, -1, 1, 1, 10);
      
      strokeWeight(sine);
      pushMatrix();
      translate(x + offset, y + offset);
      rotate(radians(rotation));
      circles(0, 0, circleSize);
      popMatrix();
      
      pushMatrix();
      translate(x, y);
      rotate(radians(rotation*-1));
      circles(0, 0, circleSize);
      popMatrix();
      
      pushMatrix();
      translate(x*2, y*2);
      rotate(radians(rotation));
      circles(0, 0, circleSize);
      popMatrix();
    }
  }
  a += 0.01;
  rotation += 1;
  
  saveFrame("Arches-#####.png");
}

void circles(float x, float y, float circleSize) {
  noFill();
  stroke(0);
  //float start = map(mouseX, 0, width, 0, PI);
  //circleBegin = map(circleBegin, 0, circleSize, 0, PI);

  //float end = map(mouseY, 0, height, PI, TWO_PI); 
  //circleEnd = map(circleEnd, 0, circleSize, PI, TWO_PI);

  //rotation += 1;
  //rotate(radians(rotation));
  arc(x, y, circleSize, circleSize, 0, PI/8);
}
