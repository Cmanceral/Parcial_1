int nLines = 250;
float rotation = 0;
float increment = 0.1;

void setup() {
  size(1000, 1000);
}

void draw() {
  backLines();

  float nLines2 = nLines /2;
  float lineWidth = width / nLines2;
  float nBlocks = 10;
  float lineHeight = (height/nBlocks);

  for ( int i = 0; i < nLines2; i++) {
    for (int j = 0; j < nBlocks; j++) {
      float x = 0;
      float y = 0;
      float offset = lineWidth;
      x = (lineWidth * i)*1.5;
      y = (lineHeight * j)+lineHeight/2;
      pushMatrix();
      translate(x, y);
      if (j % 2 == 0) {
        translate(offset,0);
        rotate(radians(rotation));
      } else {
        rotate(radians(-rotation));
      }
      frontLines(0, -lineHeight/2, lineHeight);

      popMatrix();
    }
  }
  if (rotation < -30|| rotation > 30) {
    increment *= -1;
  }

  rotation += increment;
 
 saveFrame("CruzDiez-#####");
}

void backLines() {
  noStroke();
  float lineWidth = width/nLines;
  float x = 0;
  color[] colors = {color(137, 147, 184), color(255, 94, 66), color(242, 244, 255)};

  for (int i = 0; i < nLines; i++) {
    fill(colors[ i % colors.length]);
    x = lineWidth*i;
    rect(x, 0, lineWidth, height);
  }
}

void frontLines(float x, float y, float lineHeight) {
  float nLines2 = nLines /1.5;
  float lineWidth = width / nLines2;
  fill(86, 52, 77);
  rect(x, y, lineWidth, lineHeight);
}
