float a = 0;
int nLines = 40;
float gap = 8;

void setup() {
  size(1000, 1000);
}

void draw() {

  background(0);

  int lineGap = height/nLines;
  int x = width/2;

  int y = 0;
  int y2 = 0;

  for (int i = 0; i < nLines; i++) {
    float sine1 = sin(a + (i * 0.08));
    sine1 = map(sine1, -1, 1, 0, width);

    float sine2 = sin(a - (i * 0.08));
    sine2 = map(sine2, -1, 1, 0, width);

    y = lineGap * i;
    y2 = (lineGap * i) + lineGap/2;
    
    fill(255);
    shapes(x, y+(gap*2), sine1);
    fill(127);
    shapes(x, y+gap, sine1);
    fill(0);
    shapes(x, y, sine1);
    
    fill(255);
    shapes(x, y2+(gap*2), sine2);
    fill(127);
    shapes(x, y2+gap, sine2);
    fill(0);
    shapes(x, y2, sine2);     
  }
  a += 0.01;
  
  saveFrame("sine_#####.png");
}

void shapes(float x, float y, float movement) {
  int lineGap = height/nLines; 
  float y1 = y - lineGap/2;
  float y2 = y + lineGap/2;
  noStroke();
  beginShape();
  vertex(x, y1);
  vertex(movement, y);
  vertex(x, y2);    
  endShape();
}
